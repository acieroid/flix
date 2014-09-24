package impl.verifier

import impl.logic._
import impl.runtime.{Unification, Interpreter}
import syntax.Terms.RichTerm

import scala.collection.mutable

object Verifier {

  case class Lattice(typ: Type, bot: Value, leq: Term.Abs, lub: Term.Abs, height: Term.Abs)

  def verify(program: Program): Unit = {
    val lattices = mutable.Set.empty[Lattice]
    for (declaration <- program.declarations) {
      declaration match {
        case Declaration.DeclareBot(bot, typ) if !typ.isInstanceOf[Type.Set] =>
          val leq = program.lookupLeq(typ).get
          val lub = program.lookupLub(typ).get
          val height = program.lookupHeight(typ).get
          lattices += Lattice(typ, bot, leq, lub, height)

        case _ => // nop
      }
    }

    for (lattice <- lattices) {
      verify(lattice)
    }
  }

  /**
   * Verifies that the given lattie satisfies all required lattice properties.
   */
  def verify(l: Lattice): Unit = {
    {
      println("Verifying Reflexivity:")
      val cases = tautology(Property.reflexivity(l.leq))
      cases.foreach(xs => println("  " + xs.map(_.fmt).mkString(", ") + ", proven."))
      println("Reflexivity proved.")
      println()
    }

    {
      println("Verifying Anti-symmetry:")
      val cases = tautology(Property.antiSymmetri(l.leq))
      cases.foreach(xs => println("  " + xs.map(_.fmt).mkString(", ") + ", proven."))
      println("Anti-symmetry proved.")
      println()
    }

    {
      println("Verifying Transitivity:")
      val cases = tautology(Property.transitivity(l.leq))
      cases.foreach(xs => println("  " + xs.map(_.fmt).mkString(", ") + ", proven."))
      println("Transitivity proved.")
      println()
    }

    {
      println("Verifying Upperbound:")
      val cases = tautology(Property.upperBound(l.leq, l.lub))
      cases.foreach(xs => println("  " + xs.map(_.fmt).mkString(", ") + ", proven."))
      println("Upperbound proved.")
      println()
    }

    {
      println("Verifying Least-Upperbound:")
      val cases = tautology(Property.leastUpperBound(l.leq, l.lub))
      cases.foreach(xs => println("  " + xs.map(_.fmt).mkString(", ") + ", proven."))
      println("Least-Upperbound proved.")
      println()
    }

    {
      println("Verifying Non-Negative-Height:")
      val cases = tautology(Property.nonNegative(l.height))
      cases.foreach(xs => println("  " + xs.map(_.fmt).mkString(", ") + ", proven."))
      println("Non-Negative-Height: proved.")
      println()
    }

    {
      println("Verifying Strictly-Decreasing:")
      val cases = tautology(Property.strictlyDecreasing(l.height, l.leq))
      cases.foreach(xs => println("  " + xs.map(_.fmt).mkString(", ") + ", proven."))
      println("Strictly-Decreasing: proved.")
      println()
    }
  }


  /**
   * Verifies whether the given term `t1` evaluates to `true` for all inputs.
   */
  def tautology(t0: Term): List[List[Term]] = {
    def iterate(t: Term, history: List[Term]): List[List[Term]] = evaluate(t) match {
      case Term.Bool(b) =>
        // Case 1: The term has been fully evaluated to a boolean.
        if (b)
        // The property has been proven to hold.
          List(history)
        else
        // The property does not hold!
          throw new RuntimeException("Violation for input: " + history.map(_.fmt).mkString(", "))

      case Term.Abs(x, typ, t1) =>
        // Case 2: Term has not yet been fully applied. 
        // Enumerate all terms of the argument and evaluate the term.
        enumerate(typ).toList.flatMap(a => iterate(evaluate(Term.App(t, a)), a :: history))

      case r =>
        // Case 3: The term cannot be evaluated further.
        // What remains is residual of constraints.
        // Translate the term into a constraint system.
        val constraint = compileBool(r)
        println(constraint.fmt)
        List(history)
    }

    iterate(t0, Nil)
  }

  /**
   * Returns the partial evaluation of the given term `t`.
   */
  def evaluate(t: Term): Term = t match {
    case Term.Unit => Term.Unit
    case Term.Bool(b) => Term.Bool(b)
    case Term.Int(i) => Term.Int(i)
    case Term.Str(s) => Term.Str(s)
    case Term.Set(xs) => Term.Set(xs.map(evaluate))

    case Term.Var(x) => Term.Var(x)
    case Term.Abs(s, typ, t1) => Term.Abs(s, typ, t1)

    case Term.App(t1, t2) =>
      val r1 = evaluate(t1)
      val r2 = evaluate(t2)

      r1 match {
        case Term.Abs(x, _, tb) =>
          val y = Symbol.freshVariableSymbol(x)
          val r = tb.rename(x, y).substitute(y, r2)
          evaluate(r)
        case _ => throw new RuntimeException()
      }

    case Term.Match(t1, rules) =>
      val r1 = evaluate(t1)
      matchRule(rules, r1) match {
        case None => throw new RuntimeException(s"Unmatched value ${r1.fmt}")
        case Some((t2, env)) => evaluate(t2.substitute2(env))
      }

    case Term.IfThenElse(t1, t2, t3) =>
      val r1 = evaluate(t1)
      val r2 = evaluate(t2)
      val r3 = evaluate(t3)

      r1.asValue match {
        case None => Term.IfThenElse(r1, r2, r3)
        case Some(v) => if (v.toBool) r2 else r3
      }

    //    case Term.Match

    case Term.UnaryOp(op, t1) =>
      val r1 = evaluate(t1)
      r1.asValue match {
        case None => Term.UnaryOp(op, r1)
        case Some(v1) => Interpreter.apply(op, v1).toTerm
      }
    case Term.BinaryOp(op, t1, t2) =>
      val r1 = evaluate(t1)
      val r2 = evaluate(t2)
      (r1.asValue, r2.asValue) match {
        case (Some(v1), Some(v2)) => Interpreter.apply(op, v1, v2).toTerm
        case _ => Term.BinaryOp(op, r1, r2)
      }
    case Term.Tag(n, t1, typ) => Term.Tag(n, evaluate(t1), typ)
    case Term.Tuple2(t1, t2) =>
      val r1 = evaluate(t1)
      val r2 = evaluate(t2)
      Term.Tuple2(r1, r2)
    case Term.Tuple3(t1, t2, t3) =>
      val r1 = evaluate(t1)
      val r2 = evaluate(t2)
      val r3 = evaluate(t3)
      Term.Tuple3(r1, r2, r3)
    case Term.Tuple4(t1, t2, t3, t4) =>
      val r1 = evaluate(t1)
      val r2 = evaluate(t2)
      val r3 = evaluate(t3)
      val r4 = evaluate(t4)
      Term.Tuple4(r1, r2, r3, r4)
    case Term.Tuple5(t1, t2, t3, t4, t5) =>
      val r1 = evaluate(t1)
      val r2 = evaluate(t2)
      val r3 = evaluate(t3)
      val r4 = evaluate(t4)
      val r5 = evaluate(t5)
      Term.Tuple5(r1, r2, r3, r4, r5)
  }

  /**
   * Optionally returns a pair of a term and environment for which one of the given `rules` match the given value `v`.
   */
  private def matchRule(rules: List[(Pattern, Term)], t: Term): Option[(Term, Map[Symbol.VariableSymbol, Term])] = rules match {
    case Nil => None
    case (p, t1) :: rest => Unification.unify(p, t) match {
      case None => matchRule(rest, t)
      case Some(env) => Some((t1, env))
    }
  }


  /**
   * Returns *all* terms which inhabit the given type `typ`.
   *
   * If the type is finite then a closed term is returned.
   * Otherwise an open term is returned (i.e. a term with variables).
   */
  def enumerate(typ: Type, sum: Option[Type.Sum] = None): Set[Term] = typ match {
    case Type.Unit => Set(Term.Unit)
    case Type.Bool => Set(Term.Bool(true), Term.Bool(false))
    case Type.Int => Set(Term.Var(Symbol.freshVariableSymbol("i")))

    case Type.Tag(n, typ2) => enumerate(typ2).map(x => Term.Tag(n, x, sum.get))
    case Type.Sum(ts) => ts.flatMap(x => enumerate(x, Some(Type.Sum(ts)))).toSet

    case Type.Tuple2(typ1, typ2) =>
      for (t1 <- enumerate(typ1);
           t2 <- enumerate(typ2))
      yield Term.Tuple2(t1, t2)
    case Type.Tuple3(typ1, typ2, typ3) =>
      for (t1 <- enumerate(typ1);
           t2 <- enumerate(typ2);
           t3 <- enumerate(typ3))
      yield Term.Tuple3(t1, t2, t3)
    case Type.Tuple4(typ1, typ2, typ3, typ4) =>
      for (t1 <- enumerate(typ1);
           t2 <- enumerate(typ2);
           t3 <- enumerate(typ3);
           t4 <- enumerate(typ4))
      yield Term.Tuple4(t1, t2, t3, t4)
    case Type.Tuple5(typ1, typ2, typ3, typ4, typ5) =>
      for (t1 <- enumerate(typ1);
           t2 <- enumerate(typ2);
           t3 <- enumerate(typ3);
           t4 <- enumerate(typ4);
           t5 <- enumerate(typ5))
      yield Term.Tuple5(t1, t2, t3, t4, t5)

    case Type.Set(xs) => throw new UnsupportedOperationException("Unexpected type.")
    case Type.Var(x) => throw new UnsupportedOperationException("Unexpected type.")
    case Type.Function(a, b) => throw new UnsupportedOperationException("Impossible to enumerate functions.")
    case Type.Str => throw new UnsupportedOperationException("Impossible to enumerate strings.")
  }

  /** *******************************************/

  /**
   * Returns `true` iff the term corresponds to a set of integer constraints.
   */
  def isNormalForm(t: Term): Boolean = t match {
    case Term.Var(x) => true
    case Term.Int(i) => true
    case Term.UnaryOp(op, t1) => isNormalForm(t1)
    case Term.BinaryOp(op, t1, t2) => isNormalForm(t1) && isNormalForm(t2)
    case Term.IfThenElse(t1, t2, t3) => isNormalForm(t1) && isNormalForm(t2) && isNormalForm(t3)
    case _ => false
  }

  def compileBool(t: Term): BoolExp = t match {
    case Term.BinaryOp(op, t1, t2) =>
      val e1 = compileInt(t1)
      val e2 = compileInt(t2)
      op match {
        case BinaryOperator.Equal => BoolExp.Eq(e1, e2)
        case BinaryOperator.NotEqual => BoolExp.Not(BoolExp.Eq(e1, e2))
        case BinaryOperator.GreaterEqual => BoolExp.NonNeg(IntExp.Minus(e1, e2))
      }
  }

  def compileInt(t: Term): IntExp = t match {
    case Term.Var(x) => IntExp.Var(x)
    case Term.Int(i) => IntExp.Int(i)
  }


  trait Exp {
    def fmt: String = {
      def visit(c: Exp, indent: Int): String = c.toString

      visit(this, 0)
    }
  }

  sealed trait BoolExp extends Exp

  object BoolExp {

    case object True extends BoolExp

    case object False extends BoolExp

    case class Not(e1: BoolExp) extends BoolExp

    case class Or(e1: BoolExp, e2: BoolExp) extends BoolExp

    case class And(e1: BoolExp, e2: BoolExp) extends BoolExp

    case class Ite(e1: BoolExp, e2: BoolExp, e3: BoolExp) extends BoolExp

    case class Eq(e1: IntExp, e2: IntExp) extends BoolExp

    case class NonNeg(e1: IntExp) extends BoolExp

  }

  sealed trait IntExp extends Exp

  object IntExp {

    case class Var(x: Symbol.VariableSymbol) extends IntExp

    case class Int(i: scala.Int) extends IntExp

    case class Plus(e1: IntExp, e2: IntExp) extends IntExp

    case class Minus(e1: IntExp, e2: IntExp) extends IntExp

    case class Times(e1: IntExp, e2: IntExp) extends IntExp

    case class Divide(e1: IntExp, e2: IntExp) extends IntExp

  }

  def cnf(b: BoolExp): BoolExp = ???

  def simplify(b: BoolExp): BoolExp = b match {
    case BoolExp.Eq(IntExp.Int(i1), IntExp.Int(i2)) if i1 == i2 => BoolExp.True
  }

}
