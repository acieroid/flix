//
// # Unit
//

@test
def eqUnit01(): Bool = assert!(() == ())

@test
def eqUnit02(): Bool = assertNot!(() != ())

//
// # Bool
//

@test
def eqBool01(): Bool = assert!(true == true)

@test
def eqBool02(): Bool = assert!(false == false)

@test
def neqBool01(): Bool = assert!(true != false)

@test
def neqBool02(): Bool = assert!(false != true)

//
// # Char
//

@test
def eqChar01(): Bool = assert!('a' == 'a')

@test
def eqChar02(): Bool = assert!('z' == 'z')

@test
def neqChar01(): Bool = assert!('a' != 'b')

@test
def neqChar02(): Bool = assert!('z' != 'w')

//
// # Float32
//

@test
def eqFloat32_01(): Bool = assert!(+0.0f32 == +0.0f32)

@test
def eqFloat32_02(): Bool = assert!(-0.0f32 == -0.0f32)

@test
def eqFloat32_03(): Bool = assert!(+1.0f32 == +1.0f32)

@test
def eqFloat32_04(): Bool = assert!(-1.0f32 == -1.0f32)

@test
def neqFloat32_01(): Bool = assert!(-1.0f32 != +1.0f32)

@test
def neqFloat32_02(): Bool = assert!(+1.0f32 != -1.0f32)

//
// # Float64
//

@test
def eqFloat64_01(): Bool = assert!(+0.0f64 == +0.0f64)

@test
def eqFloat64_02(): Bool = assert!(-0.0f64 == -0.0f64)

@test
def eqFloat64_03(): Bool = assert!(+1.0f64 == +1.0f64)

@test
def eqFloat64_04(): Bool = assert!(-1.0f64 == -1.0f64)

@test
def neqFloat64_01(): Bool = assert!(-1.0f64 != +1.0f64)

@test
def neqFloat64_02(): Bool = assert!(+1.0f64 != -1.0f64)

//
// # Int8
//

@test
def eqInt8_01(): Bool = assert!(0i8 == 0i8)

@test
def eqInt8_02(): Bool = assert!(+1i8 == +1i8)

@test
def eqInt8_03(): Bool = assert!(-1i8 == -1i8)

@test
def neqInt8_01(): Bool = assert!(-1i8 != +1i8)

@test
def neqInt8_02(): Bool = assert!(+1i8 != -1i8)


//
// # Int16
//

@test
def eqInt16_01(): Bool = assert!(0i16 == 0i16)

@test
def eqInt16_02(): Bool = assert!(+1i16 == +1i16)

@test
def eqInt16_03(): Bool = assert!(-1i16 == -1i16)

@test
def neqInt16_01(): Bool = assert!(-1i16 != +1i16)

@test
def neqInt16_02(): Bool = assert!(+1i16 != -1i16)

//
// # Int32
//

@test
def eqInt32_01(): Bool = assert!(0i32 == 0i32)

@test
def eqInt32_02(): Bool = assert!(+1i32 == +1i32)

@test
def eqInt32_03(): Bool = assert!(-1i32 == -1i32)

@test
def neqInt32_01(): Bool = assert!(-1i32 != +1i32)

@test
def neqInt32_02(): Bool = assert!(+1i32 != -1i32)

//
// # Int64
//

@test
def eqInt64_01(): Bool = assert!(0i64 == 0i64)

@test
def eqInt64_02(): Bool = assert!(+1i64 == +1i64)

@test
def eqInt64_03(): Bool = assert!(-1i64 == -1i64)

@test
def neqInt64_01(): Bool = assert!(-1i64 != +1i64)

@test
def neqInt64_02(): Bool = assert!(+1i64 != -1i64)

//
// # BigInt
//

@test
def eqBigInt01(): Bool = assert!(0ii == 0ii)

@test
def eqBigInt02(): Bool = assert!(+1ii == +1ii)

@test
def eqBigInt03(): Bool = assert!(-1ii == -1ii)

@test
def neqBigInt01(): Bool = assert!(-1ii != +1ii)

@test
def neqBigInt02(): Bool = assert!(+1ii != -1ii)

//
// # Str
//

@test
def eqStr01(): Bool = assert!("" == "")

@test
def eqStr02(): Bool = assert!("a" == "a")

@test
def eqStr03(): Bool = assert!("abc" == "abc")

@test
def neqStr01(): Bool = assert!("" != "a")

@test
def neqStr02(): Bool = assert!("a" != "abc")

//
// # Tuples
//

@test
def eqTuple01(): Bool = assert!(() == ())

@test
def eqTuple02(): Bool = assert!((1, 2) == (1, 2))

@test
def eqTuple03(): Bool = assert!((1, 2, 3) == (1, 2, 3))

@test
def eqTuple04(): Bool = assert!((1, 2, 3, 4) == (1, 2, 3, 4))

@test
def eqTuple05(): Bool = assert!((1, 2, 3, 4, 5) == (1, 2, 3, 4, 5))

@test
def eqTuple06(): Bool = assert!((true, "foo") == (true, "foo"))

@test
def eqTuple07(): Bool = assert!((true, 'a', "foo") == (true, 'a', "foo"))

@test
def eqTuple08(): Bool = assert!((true, 'a', 42, "foo", ()) == (true, 'a', 42, "foo", ()))

@test
def eqTuple09(): Bool = assert!((1i8, 2i16, 3i32, 4i64, 5.0f32, 6.0f64) == (1i8, 2i16, 3i32, 4i64, 5.0f32, 6.0f64))

@test
def eqTuple10(): Bool = assert!((1, (2, 3)) == (1, (2, 3)))

@test
def eqTuple11(): Bool = assert!((1, (2, (3, 4))) == (1, (2, (3, 4))))

@test
def eqTuple12(): Bool = assert!(((1, 2), (3, 4)) == ((1, 2), (3, 4)))

@test
def eqTuple13(): Bool = assert!(((1, 2), (3, (4, 5))) == ((1, 2), (3, (4, 5))))

@test
def neqTuple01(): Bool = assert!(true)

@test
def neqTuple02(): Bool = assert!((1, 2) != (2, 1))

@test
def neqTuple03(): Bool = assert!((1, 2, 3) != (3, 2, 1))

@test
def neqTuple04(): Bool = assert!((1, 2, 3, 4) != (1, 2, 4, 3))

@test
def neqTuple05(): Bool = assert!((1, 2, 3, 4, 5) != (1, 5, 3, 4, 2))

@test
def neqTuple06(): Bool = assert!((true, "foo") != (false, "foo"))

@test
def neqTuple07(): Bool = assert!((true, 'a', "foo") != (true, 'b', "foo"))

@test
def neqTuple08(): Bool = assert!((true, 'a', 42, "foo", ()) != (true, 'a', 21, "foo", ()))

@test
def neqTuple09(): Bool = assert!((1i8, 2i16, 3i32, 4i64, 5.0f32, 6.0f64) != (1i8, 2i16, 3i32, 4i64, 5.0f32, 42.0f64))

@test
def neqTuple10(): Bool = assert!((1, (2, 3)) != (1, (3, 2)))

@test
def neqTuple11(): Bool = assert!((1, (2, (3, 4))) != (1, (3, (2, 4))))

@test
def neqTuple12(): Bool = assert!(((1, 2), (3, 4)) != ((1, 2), (42, 4)))

@test
def neqTuple13(): Bool = assert!(((1, 2), (3, (4, 5))) != ((1, 2), (3, (42, 5))))

//
// # Set
//

@test
def eqSet01(): Bool = assert!(Set#{} == Set#{})

@test
def eqSet02(): Bool = assert!(Set#{1} == Set#{1})

@test
def eqSet03(): Bool = assert!(Set#{Set#{3}} == Set#{Set#{3}})

@test
def eqSet04(): Bool = assert!(Set#{Set#{3, 2}} == Set#{Set#{2, 3}})

@test
def eqSet05(): Bool = assert!(Set#{Set#{Set#{}}} == Set#{Set#{Set#{}}})

@test
def eqSet06(): Bool = assert!(Set#{Set#{Set#{4}}} == Set#{Set#{Set#{4}}})

@test
def eqSet07(): Bool = assert!(Set#{Set#{Set#{4, 11}}} == Set#{Set#{Set#{11, 4}}})

@test
def eqSet08(): Bool = assert!(Set#{Set#{Set#{4, 12, 1}, Set#{16, 24, 1}}} == Set#{Set#{Set#{4, 1, 12}, Set#{24, 16, 1}}})

@test
def eqSet09(): Bool = assert!(Set#{Set#{Set#{4, 12, 1}, Set#{22, 3, 33}, Set#{16, 24, 1}}} ==
                            Set#{Set#{Set#{22, 3, 33}, Set#{4, 1, 12}, Set#{24, 16, 1}}})

@test
def eqSet10(): Bool = assert!(Set#{Set#{Set#{4, 12, 1}, Set#{22, 3, 33}, Set#{16, 24, 1}, Set#{}}} ==
                            Set#{Set#{Set#{22, 3, 33}, Set#{}, Set#{4, 1, 12}, Set#{24, 16, 1}}})

@test
def eqSet11(): Bool = assert!(Set#{1, 2} == Set#{2, 1})

@test
def eqSet12(): Bool = assert!(Set#{1, 2} == Set#{1, 2})

@test
def eqSet13(): Bool = assert!(Set#{Set#{}, Set#{1, 2}} == Set#{Set#{1, 2}, Set#{}})

@test
def eqSet14(): Bool = assert!(Set#{Set#{44}, Set#{1, 2}} == Set#{Set#{1, 2}, Set#{44}})

@test
def eqSet15(): Bool = assert!(Set#{Set#{Set#{}}, Set#{Set#{}, Set#{2}}} == Set#{Set#{Set#{2}, Set#{}}, Set#{Set#{}}})

@test
def eqSet16(): Bool = assert!(Set#{Set#{Set#{}, Set#{4, 5}}, Set#{Set#{1}, Set#{6, 7, 9}}} == Set#{Set#{Set#{1}, Set#{7, 9, 6}}, Set#{Set#{}, Set#{4, 5}}})

@test
def eqSet17(): Bool = assert!(Set#{Set#{Set#{}, Set#{4, 5}, Set#{2, 3, 4}}, Set#{Set#{1}, Set#{6, 7, 9}}} ==
                            Set#{Set#{Set#{1}, Set#{7, 9, 6}}, Set#{Set#{2, 3, 4}, Set#{}, Set#{4, 5}}})

@test
def eqSet18(): Bool = assert!(Set#{Set#{Set#{Set#{4}}, Set#{Set#{4, 5}, Set#{2, 1}}}, Set#{Set#{Set#{1}}, Set#{Set#{6, 7, 9}, Set#{2, 3}}}} ==
                            Set#{Set#{Set#{Set#{1, 2}, Set#{5, 4}}, Set#{Set#{4}}}, Set#{Set#{Set#{1}}, Set#{Set#{2, 3}, Set#{9, 6, 7}}}})

@test
def eqSet19(): Bool = assert!(Set#{1, 2, 3} == Set#{2, 3, 1})

@test
def eqSet20(): Bool = assert!(Set#{Set#{}, Set#{1, 2, 3}, Set#{2, 3, 4}} == Set#{Set#{4, 2, 3}, Set#{3, 1, 2}, Set#{}})

@test
def eqSet21(): Bool = assert!(Set#{Set#{}, Set#{Set#{1, 3}, Set#{4}}, Set#{Set#{2, 3}, Set#{4}}} == Set#{Set#{Set#{4}, Set#{2, 3}}, Set#{Set#{3, 1}, Set#{4}}, Set#{}})

@test
def eqSet22(): Bool = assert!(Set#{Set#{}, Set#{Set#{Set#{1, 3}}, Set#{Set#{4}}}, Set#{Set#{Set#{2}, Set#{3}}, Set#{Set#{4}}}} ==
                            Set#{Set#{Set#{Set#{4}}, Set#{Set#{2}, Set#{3}}}, Set#{Set#{Set#{3, 1}}, Set#{Set#{4}}}, Set#{}})

@test
def neqSet01(): Bool = assert!(Set#{1} != Set#{})

@test
def neqSet02(): Bool = assert!(Set#{1} != Set#{2})

@test
def neqSet03(): Bool = assert!(Set#{Set#{3}} != Set#{Set#{4}})

@test
def neqSet04(): Bool = assert!(Set#{Set#{3, 2}} != Set#{Set#{2, 4}})

@test
def neqSet05(): Bool = assert!(Set#{Set#{3, 2}} != Set#{Set#{2, 3}, Set#{}})

@test
def neqSet06(): Bool = assert!(Set#{Set#{Set#{}}} != Set#{Set#{Set#{11}}})

@test
def neqSet07(): Bool = assert!(Set#{Set#{}} != Set#{Set#{Set#{}}})

@test
def neqSet08(): Bool = assert!(Set#{Set#{Set#{4}}} != Set#{Set#{Set#{5}}})

@test
def neqSet09(): Bool = assert!(Set#{Set#{Set#{4}}} != Set#{Set#{Set#{4}, Set#{4, 1}}})

@test
def neqSet10(): Bool = assert!(Set#{Set#{Set#{4, 11}}} != Set#{Set#{Set#{11, 5}}})

@test
def neqSet11(): Bool = assert!(Set#{Set#{Set#{4, 12, 1}, Set#{16, 24, 1}}} != Set#{Set#{Set#{4, 12}, Set#{24, 16, 1}}})

@test
def neqSet12(): Bool = assert!(Set#{Set#{Set#{4, 12, 1}, Set#{22, 3, 33}, Set#{16, 24, 1}}} !=
                            Set#{Set#{Set#{22, 3, 33}, Set#{4, 1, 12}, Set#{24, 16, 11}}})

@test
def neqSet13(): Bool = assert!(Set#{Set#{Set#{4, 12, 1}, Set#{22, 3, 33}, Set#{16, 24, 1}}} !=
                            Set#{Set#{Set#{22, 3, 33}, Set#{4, 1, 12}, Set#{9}, Set#{24, 16, 1}}})

@test
def neqSet14(): Bool = assert!(Set#{Set#{Set#{4, 12, 1}, Set#{22, 3, 33}, Set#{16, 24, 1}, Set#{}}} !=
                            Set#{Set#{Set#{2, 3, 33}, Set#{}, Set#{4, 1, 12}, Set#{24, 16, 11}}})

@test
def neqSet15(): Bool = assert!(Set#{1, 2} != Set#{2, 3})

@test
def neqSet16(): Bool = assert!(Set#{1, 2} != Set#{8})

@test
def neqSet17(): Bool = assert!(Set#{Set#{}, Set#{1, 2}} != Set#{Set#{1}, Set#{2}})

@test
def neqSet18(): Bool = assert!(Set#{Set#{44}, Set#{1, 2}} != Set#{Set#{1, 3}, Set#{44}})

@test
def neqSet19(): Bool = assert!(Set#{Set#{44}, Set#{1, 2}} != Set#{Set#{1, 2}, Set#{2, 3}, Set#{44}})

@test
def neqSet20(): Bool = assert!(Set#{Set#{Set#{8}}, Set#{Set#{}, Set#{2}}} != Set#{Set#{Set#{2}, Set#{}}, Set#{Set#{}}})

@test
def neqSet21(): Bool = assert!(Set#{Set#{Set#{}, Set#{4, 5}}, Set#{Set#{1}, Set#{6, 8, 9}}} != Set#{Set#{Set#{1}, Set#{7, 9, 6}}, Set#{Set#{}, Set#{4, 5}}})

@test
def neqSet22(): Bool = assert!(Set#{Set#{Set#{}, Set#{4, 5}, Set#{2, 3, 4}}, Set#{Set#{1}, Set#{6, 7, 9}}} !=
                            Set#{Set#{Set#{1}, Set#{7, 9, 6}}, Set#{Set#{2, 7, 4}, Set#{1}, Set#{4, 5}}})

@test
def neqSet23(): Bool = assert!(Set#{Set#{Set#{Set#{4}}, Set#{Set#{4, 5}, Set#{2, 1}}}, Set#{Set#{Set#{1}}, Set#{Set#{6, 7, 9}, Set#{2, 3}}}} !=
                            Set#{Set#{Set#{Set#{1, 2, 3}, Set#{5, 4}}, Set#{Set#{4}}}, Set#{Set#{Set#{1}}, Set#{Set#{2, 3}, Set#{9, 6, 7}}}})

@test
def neqSet24(): Bool = assert!(Set#{1, 2, 3} != Set#{2, 3, 4})

@test
def neqSet25(): Bool = assert!(Set#{1, 2, 3} != Set#{2, 3, 1, 0})

@test
def neqSet26(): Bool = assert!(Set#{Set#{}, Set#{1, 2, 3}, Set#{2, 3}} != Set#{Set#{4, 2, 3}, Set#{3, 1, 2}, Set#{}})

@test
def neqSet27(): Bool = assert!(Set#{Set#{}, Set#{Set#{1, 3}, Set#{4, 5}}, Set#{Set#{2, 3}, Set#{4}}} !=
                             Set#{Set#{Set#{4}, Set#{2, 3, 4}}, Set#{Set#{3, 1}, Set#{4, 5}}, Set#{}})

@test
def neqSet28(): Bool = assert!(Set#{Set#{}, Set#{Set#{Set#{1, 3}}, Set#{Set#{4}}}, Set#{Set#{Set#{2}, Set#{3}}, Set#{Set#{4}}}} !=
                            Set#{Set#{Set#{Set#{4}}, Set#{Set#{2}, Set#{3}}}, Set#{Set#{Set#{3, 1, 17}}, Set#{Set#{4}}}, Set#{}})

//
// # Map
//

@test
def eqMap01(): Bool = assert!(Map#{} == Map#{})

@test
def eqMap02(): Bool = assert!(Map#{1 -> 2} == Map#{1 -> 2})

@test
def eqMap03(): Bool = assert!(Map#{Map#{3 -> 2} -> 4} == Map#{Map#{3 -> 2} -> 4})

@test
def eqMap04(): Bool = assert!(Map#{Map#{3 -> 2, 2 -> 2} -> Map#{1 -> 4}} == Map#{Map#{2 -> 2, 3 -> 2} -> Map#{1 -> 4}})

@test
def eqMap05(): Bool = assert!(Map#{3 -> Map#{1 -> 4, 2 -> 8}} == Map#{3 -> Map#{2 -> 8, 1 -> 4}})

@test
def eqMap06(): Bool = assert!(Map#{Map#{3 -> Map#{2 -> 1, 5 -> 6}, 2 -> Map#{2 -> 6, 8 -> 16}} -> Map#{1 -> Map#{1 -> 4, 2 -> 3, 9 -> 8}}} ==
                            Map#{Map#{2 -> Map#{2 -> 6, 8 -> 16}, 3 -> Map#{5 -> 6, 2 -> 1}} -> Map#{1 -> Map#{2 -> 3, 9 -> 8, 1 -> 4}}})

@test
def eqMap07(): Bool = assert!(Map#{Map#{Map#{3 -> 3} -> Map#{2 -> 1, 5 -> 6}, Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}} -> Map#{1 -> Map#{1 -> 4, 2 -> 3, 9 -> 8}}} ==
                            Map#{Map#{Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}, Map#{3 -> 3} -> Map#{5 -> 6, 2 -> 1}} -> Map#{1 -> Map#{2 -> 3, 9 -> 8, 1 -> 4}}})

@test
def eqMap08(): Bool = assert!(Map#{Map#{Map#{3 -> 3, 8 -> 8} -> Map#{2 -> 1, 5 -> 6}, Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}} -> Map#{1 -> Map#{1 -> 4, 2 -> 3, 9 -> 8}}} ==
                            Map#{Map#{Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}, Map#{8 -> 8, 3 -> 3} -> Map#{5 -> 6, 2 -> 1}} -> Map#{1 -> Map#{2 -> 3, 9 -> 8, 1 -> 4}}})

@test
def eqMap09(): Bool = assert!(Map#{1 -> 2, 3 -> 4} == Map#{1 -> 2, 3 -> 4})

@test
def eqMap10(): Bool = assert!(Map#{1 -> 2, 3 -> 4} == Map#{3 -> 4, 1 -> 2})

@test
def eqMap11(): Bool = assert!(Map#{Map#{1 -> 2} -> Map#{3 -> 4}, Map#{3 -> 4} -> Map#{4 -> 5}} ==
                            Map#{Map#{3 -> 4} -> Map#{4 -> 5}, Map#{1 -> 2} -> Map#{3 -> 4}})

@test
def eqMap12(): Bool = assert!(Map#{Map#{1 -> 2, 8 -> 9} -> Map#{3 -> 4}, Map#{3 -> 4, 4 -> 3, 7 -> 8} -> Map#{4 -> 5}} ==
                            Map#{Map#{7 -> 8, 4 -> 3, 3 -> 4} -> Map#{4 -> 5}, Map#{8 -> 9, 1 -> 2} -> Map#{3 -> 4}})

@test
def eqMap13(): Bool = assert!(Map#{Map#{1 -> 2, 8 -> 9} -> Map#{3 -> Map#{4 -> 4, 2 -> 6}}, Map#{3 -> 4, 4 -> 3, 7 -> 8} -> Map#{4 -> Map#{2 -> 6, 4 -> 4}}} ==
                            Map#{Map#{7 -> 8, 4 -> 3, 3 -> 4} -> Map#{4 -> Map#{2 -> 6, 4 -> 4}}, Map#{8 -> 9, 1 -> 2} -> Map#{3 -> Map#{2 -> 6, 4 -> 4}}})

@test
def eqMap14(): Bool = assert!(Map#{1 -> 2, 5 -> 6, 3 -> 4} == Map#{1 -> 2, 5 -> 6, 3 -> 4})

@test
def eqMap15(): Bool = assert!(Map#{1 -> 2, 3 -> 4, 5 -> 6} == Map#{5 -> 6, 3 -> 4, 1 -> 2})

@test
def neqMap01(): Bool = assert!(Map#{} != Map#{1 -> 2})

@test
def neqMap02(): Bool = assert!(Map#{1 -> 2} != Map#{1 -> 3})

@test
def neqMap03(): Bool = assert!(Map#{1 -> 2} != Map#{2 -> 2})

@test
def neqMap04(): Bool = assert!(Map#{Map#{3 -> 2} -> 4} != Map#{Map#{3 -> 1} -> 4})

@test
def neqMap05(): Bool = assert!(Map#{Map#{3 -> 2} -> 4} != Map#{Map#{3 -> 2} -> 2})

@test
def neqMap06(): Bool = assert!(Map#{Map#{3 -> 2, 2 -> 2} -> Map#{1 -> 4}} != Map#{Map#{2 -> 2, 3 -> 3} -> Map#{1 -> 4}})

@test
def neqMap07(): Bool = assert!(Map#{3 -> Map#{1 -> 4, 2 -> 8}} != Map#{3 -> Map#{2 -> 4, 1 -> 4}})

@test
def neqMap08(): Bool = assert!(Map#{3 -> Map#{1 -> 4, 2 -> 8}} != Map#{6 -> Map#{2 -> 8, 1 -> 4}})

@test
def neqMap09(): Bool = assert!(Map#{Map#{3 -> Map#{2 -> 1, 5 -> 6}, 2 -> Map#{2 -> 6, 8 -> 16}} -> Map#{1 -> Map#{1 -> 4, 2 -> 3, 9 -> 8}}} !=
                            Map#{Map#{2 -> Map#{2 -> 6, 8 -> 16}, 3 -> Map#{5 -> 6, 2 -> 19}} -> Map#{1 -> Map#{2 -> 3, 9 -> 8, 1 -> 4}}})

@test
def neqMap10(): Bool = assert!(Map#{Map#{1 -> Map#{2 -> 1, 5 -> 6}, 2 -> Map#{2 -> 6, 8 -> 16}} -> Map#{1 -> Map#{1 -> 4, 2 -> 3, 9 -> 8}}} !=
                            Map#{Map#{2 -> Map#{2 -> 6, 8 -> 16}, 3 -> Map#{5 -> 6, 2 -> 1}} -> Map#{1 -> Map#{2 -> 3, 9 -> 8, 1 -> 4}}})

@test
def neqMap11(): Bool = assert!(Map#{Map#{Map#{3 -> 3} -> Map#{2 -> 1, 5 -> 6}, Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}} -> Map#{1 -> Map#{1 -> 4, 2 -> 3, 9 -> 8}}} !=
                            Map#{Map#{Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}, Map#{3 -> 3} -> Map#{5 -> 7, 2 -> 1}} -> Map#{1 -> Map#{2 -> 3, 9 -> 8, 1 -> 4}}})

@test
def neqMap12(): Bool = assert!(Map#{Map#{Map#{3 -> 3} -> Map#{2 -> 1, 5 -> 6}, Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}} -> Map#{1 -> Map#{1 -> 4, 2 -> 3, 9 -> 8}}} !=
                            Map#{Map#{Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}, Map#{3 -> 3} -> Map#{5 -> 6, 2 -> 1}} -> Map#{1 -> Map#{2 -> 3, 9 -> 8, 1 -> 5}}})

@test
def neqMap13(): Bool = assert!(Map#{Map#{Map#{3 -> 3, 8 -> 8} -> Map#{2 -> 1, 5 -> 6}, Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}} -> Map#{1 -> Map#{1 -> 4, 2 -> 3, 9 -> 8}}} !=
                            Map#{Map#{Map#{2 -> 2} -> Map#{2 -> 6, 8 -> 16}, Map#{8 -> 8, 3 -> 33} -> Map#{5 -> 6, 2 -> 1}} -> Map#{1 -> Map#{2 -> 3, 9 -> 8, 1 -> 4}}})

@test
def neqMap14(): Bool = assert!(Map#{1 -> 2, 3 -> 4} != Map#{1 -> 2, 3 -> 5})

@test
def neqMap15(): Bool = assert!(Map#{1 -> 2, 3 -> 4} != Map#{1 -> 2})

@test
def neqMap16(): Bool = assert!(Map#{1 -> 2, 3 -> 4} != Map#{3 -> 5, 1 -> 2})

@test
def neqMap17(): Bool = assert!(Map#{Map#{1 -> 2} -> Map#{3 -> 4}, Map#{3 -> 4} -> Map#{4 -> 5}} !=
                            Map#{Map#{3 -> 4} -> Map#{4 -> 5}, Map#{1 -> 2} -> Map#{3 -> 11}})

@test
def neqMap18(): Bool = assert!(Map#{Map#{1 -> 2, 8 -> 9} -> Map#{3 -> 4}, Map#{3 -> 4, 4 -> 3, 7 -> 8} -> Map#{4 -> 5}} !=
                            Map#{Map#{7 -> 8, 4 -> 3, 3 -> 4} -> Map#{4 -> 5}, Map#{8 -> 9, 1 -> 2} -> Map#{3 -> 11}})

@test
def neqMap19(): Bool = assert!(Map#{Map#{1 -> 2, 8 -> 9} -> Map#{3 -> Map#{4 -> 4, 2 -> 6}}, Map#{3 -> 4, 4 -> 3, 7 -> 8} -> Map#{4 -> Map#{2 -> 6, 4 -> 4}}} !=
                            Map#{Map#{7 -> 8, 4 -> 3, 3 -> 4} -> Map#{4 -> Map#{2 -> 6, 4 -> 4}}, Map#{8 -> 10, 1 -> 2} -> Map#{3 -> Map#{2 -> 6, 4 -> 4}}})

@test
def neqMap20(): Bool = assert!(Map#{1 -> 2, 5 -> 6, 3 -> 4} != Map#{1 -> 2, 5 -> 6})

@test
def neqMap21(): Bool = assert!(Map#{1 -> 2, 3 -> 4, 5 -> 6} != Map#{5 -> 6, 3 -> 4, 1 -> 3})

//
// # Tags
//

@test
def eqTag01(): Bool = assert!(None == None)

@test
def eqTag02(): Bool = assert!(Some(42) == Some(42))

@test
def eqTag03(): Bool = assert!(Ok(42) == Ok(42))

@test
def eqTag04(): Bool = assert!(Err(42) == Err(42))

@test
def eqTag05(): Bool = assert!(Nil == Nil)

@test
def eqTag06(): Bool = assert!((42 :: Nil) == (42 :: Nil))

@test
def eqTag07(): Bool = assert!(Some(Ok(42)) == Some(Ok(42)))

@test
def eqTag08(): Bool = assert!(Ok(Some(42)) == Ok(Some(42)))

@test
def eqTag09(): Bool = assert!(Some((Ok(1) :: Err(2) :: Nil)) == Some((Ok(1) :: Err(2) :: Nil)))

@test
def neqTag01(): Bool = assert!(None != Some(42))

@test
def neqTag02(): Bool = assert!(Some(21) != Some(42))

@test
def neqTag03(): Bool = assert!(Ok(21) != Ok(42))

@test
def neqTag04(): Bool = assert!(Err(21) != Err(42))

@test
def neqTag05(): Bool = assert!(Nil != (42 :: Nil))

@test
def neqTag06(): Bool = assert!((21 :: Nil) != (42 :: Nil))

@test
def neqTag07(): Bool = assert!(Some(Ok(21)) != Some(Err(42)))

@test
def neqTag08(): Bool = assert!(Ok(None) != Ok(Some(42)))

@test
def neqTag09(): Bool = assert!(Some((Ok(1) :: Err(2) :: Nil)) != Some((Err(1) :: Ok(2) :: Nil)))

//
// # Composition of Data Types
//

@test
def eqCompose01(): Bool = assert!(Some(Map#{1 -> 2, 3 -> 4}) == Some(Map#{3 -> 4, 1 -> 2}))

@test
def eqCompose02(): Bool = assert!(Some(Map#{1 -> (1 :: 2 :: Nil), 3 -> (3 :: 4 :: Nil)}) ==
                                Some(Map#{3 -> (3 :: 4 :: Nil), 1 -> (1 :: 2 :: Nil)}))

@test
def eqCompose03(): Bool = assert!(Some(Map#{1 -> (Set#{1, 2, 3, 4, 5} :: Set#{2, 1} :: Nil), 3 -> (Set#{3} :: Set#{4, 2} :: Nil)}) ==
                                Some(Map#{3 -> (Set#{3} :: Set#{4, 2} :: Nil), 1 -> (Set#{1, 5, 4, 2, 3} :: Set#{1, 2} :: Nil)}))

@test
def eqCompose04(): Bool = assert!(Some(Map#{1 -> (Set#{1, 2, 3, 4, 5} :: Set#{2, 1} :: Nil, Ok(2)), 3 -> (Set#{3} :: Set#{4, 2} :: Nil, Ok(1))}) ==
                                Some(Map#{3 -> (Set#{3} :: Set#{4, 2} :: Nil, Ok(1)), 1 -> (Set#{1, 5, 4, 2, 3} :: Set#{1, 2} :: Nil, Ok(2))}))

@test
def eqCompose05(): Bool = assert!(Some(Map#{1 -> (Set#{1, 2, 3, 4, 5} :: Set#{2, 1} :: Nil, Ok(Set#{2, 3, 8})), 3 -> (Set#{3} :: Set#{4, 2} :: Nil, Ok(Set#{99, 4}))}) ==
                                Some(Map#{3 -> (Set#{3} :: Set#{4, 2} :: Nil, Ok(Set#{4, 99})), 1 -> (Set#{1, 5, 4, 2, 3} :: Set#{1, 2} :: Nil, Ok(Set#{8, 2, 3}))}))

@test
def eqCompose06(): Bool = assert!((Map#{1 -> 4, 5 -> 6}, Set#{1, 2, 3, 4}, Err(Set#{9, 18})) ==
                                (Map#{5 -> 6, 1 -> 4}, Set#{4, 2, 3, 1}, Err(Set#{18, 9})))
