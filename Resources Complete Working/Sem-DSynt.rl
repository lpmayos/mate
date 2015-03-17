
Sem<=>DSynt abstract transfer_attribute : rule
[
  leftside = [

  ]
  conditions = [

  ]
  rightside = [

  ]
  correspondence = [

  ]
]
Sem<=>DSynt abstract transfer_node : rule
[
  leftside = [

  ]
  conditions = [

  ]
  rightside = [

  ]
  correspondence = [

  ]
]
Sem<=>DSynt abstract transfer_relation : rule
[
  leftside = [

  ]
  conditions = [

  ]
  rightside = [

  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_attr_BACKGROUNDED : transfer_attribute
[
  leftside = [
?Sl {
  sem=specifier
  main-> ?Xl
}
  ]
  conditions = [

  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  perspective=FORE
}
  ]
  correspondence = [

  ]
]
/*If no definiteness is established in the structure or the lexicon, this rule sets it as "indefinite".*/
Sem<=>DSynt transfer_attr_DEF_default : transfer_attribute
[
  leftside = [
?Xl
  ]
  conditions = [
not lexicon::(?Xr.dlex).definiteness;
lexicon::(?Xr.dlex).dpos=N;
not lexicon::(?Xr.dlex).spos=proper_noun;
not lexicon::(?Xr.dlex).det=NO;
not ?Xl.definiteness;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  definiteness=INDEF
}
  ]
  correspondence = [

  ]
]
/*Rules gets the dpos of a node in the lexicon.*/
Sem<=>DSynt transfer_attr_DEF_lexicon : transfer_attribute
[
  leftside = [
?Xl
  ]
  conditions = [
lexicon::(?Xr.dlex).definiteness;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  definiteness=lexicon::(?Xr.dlex).definiteness
}
  ]
  correspondence = [

  ]
]
/*Rules gets the definiteness of a noun in the lexicon.*/
Sem<=>DSynt transfer_attr_DPOS_lexicon : transfer_attribute
[
  leftside = [
?Xl
  ]
  conditions = [
lexicon::(?Xr.dlex).dpos;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  dpos=lexicon::(?Xr.dlex).dpos
}
  ]
  correspondence = [

  ]
]
/*Rules gets the number of a noun in the lexicon in case it's not defined in the structure.*/
Sem<=>DSynt transfer_attr_NUM_lexicon : transfer_attribute
[
  leftside = [
?Xl
  ]
  conditions = [
lexicon::(?Xr.dlex).number;
not ?Xl.number;	//the node doesn't already have a number specified in the semantic structure
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  number=lexicon::(?Xr.dlex).number
}
  ]
  correspondence = [

  ]
]
/*Finite verbs with no established tense in the Sem Str are assigned "Present" by default.*/
Sem<=>DSynt transfer_attr_TENSE_default : transfer_attribute
[
  leftside = [
?Xl
  ]
  conditions = [
not ?Xl.tense;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  rc:finiteness=FIN
  tense=PRES
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_attr_VOICE : transfer_attribute
[
  leftside = [
//The main node of the Theme is the Arg 1 of the main of the Rheme
?Rh{ sem=rheme
     main-> ?Xl{ 1-> ?Yl{} }
}
?Th{ sem=theme
     main-> ?Yl{}
}
// both belong to the same sentence:
?S{
  sem=sentence
  ?Rh{}
  ?Th{}
}
  ]
  conditions = [

  ]
  rightside = [
// the syntactic root is a finite active verb
rc:?Xr{
  <=> ?Xl
  clause=main
  finiteness=FIN
  voice=ACT
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_future : transfer_attribute
[
  leftside = [
?Sp {
  sem = specifier
  ?Xl {
    1 -> ?Yl {
      1 -> ?Zl
    }
  }
}
?Rh {
  sem = rheme
  main -> ?Zl
}
  ]
  conditions = [
?Xl.sem = FUTURE;
  ]
  rightside = [
rc:?Zr {
  <=> ?Zl
  rc:finiteness = FIN
  tense = FUT
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt LOCIN : transfer_node
[
  leftside = [
?Xl {
  sem = LOCATION
  1 -> ?Yl
  2 -> ?Zl
}
  ]
  conditions = [

  ]
  rightside = [
?Xr {
  <=> ?Xl
  dlex = Locin
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_bubble_recopy : transfer_node
[
  leftside = [
?Bl* {
  ?Xl
  sem=sentence
}
  ]
  conditions = [

  ]
  rightside = [
?Br {
  <=> ?Bl
  bubble=yes
  dlex=S
  rc:?Xr {<=> ?Xl}
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_lex_Oper1 : transfer_node
[
  leftside = [
?Xl
?L<-concepticon::(?Xl.sem).lex
  ]
  conditions = [
lexicon::(?Yr.dlex).Oper1;
  ]
  rightside = [
?Xr {
  <=> ?Xl
  dlex=Oper1
  II -> rc:?Yr {
    <=> ?Xl
    dlex=?L
  }
}
rc:?B {
  rc:?Yr
  ?Xr
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_lex_recopy : transfer_node
[
  leftside = [
?Xl
  ]
  conditions = [
not concepticon::(?Xl.sem).lex;
not ?Xl COREF-> ?N;
not ?Xl.bubble;
not concepticon::(?Xl.sem).type=meta;
  ]
  rightside = [
?Xr {
  <=> ?Xl
  dlex=?Xl.sem
  number=?Xl.number
  definiteness=?Xl.definiteness
  aspect=?Xl.aspect
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_lex_semanticon : transfer_node
[
  leftside = [
?Xl
?L<-concepticon::(?Xl.sem).lex
  ]
  conditions = [
concepticon::(?Xl.sem).lex;
not ?Xl COREF-> ?N;
not ?Xl.bubble;
not concepticon::(?Xl.sem).type=meta;
  ]
  rightside = [
?Xr {
  <=> ?Xl
  dlex=?L
}
  ]
  correspondence = [

  ]
]
/*That's how the DSynt tree should be built: first transfer root node with basic properties; only later its name
and, with its combinatorial properties, its dependents with their basic properties, and so on.*/
Sem<=>DSynt disabled transfer_synt_root_rheme : transfer_node
[
  leftside = [
// the main node of the rheme is the main predicate:
?Rh{ sem=rheme
     main-> ?Xl{ ?r-> ?Yl{} }
}
?Th{ sem=theme
     main-> ?Yl{}
}
// both belong to the same sentence:
?S{
  sem=S
  ?Rh{}
  ?Th{}
}
  ]
  conditions = [

  ]
  rightside = [
// the syntactic root is a finite indicative verb:
?Xr{
  <=> ?Xl
  clause=main
  dpos=V
  finiteness=FIN
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt oper_locin : transfer_relation
[
  leftside = [
?Xl {
  sem = LOCATION
  1 -> ?Yl
  2 -> ?Zl
}
  ]
  conditions = [
not lexicon::(?Yr.dlex).lf = yes;
  ]
  rightside = [
rc:?Yr {
  <=> ?Yl
  ATTR -> ?Or {
    <=> ?Xl
  }
}
  ]
  correspondence = [

  ]
]
/*A rule to transfer the meta node TIME*/
Sem<=>DSynt disabled transfer_rel_TIME : transfer_relation
[
  leftside = [
?Xl {
  sem=TIME
  1-> ?Yl
  2-> ?Zl
}
  ]
  conditions = [
//added for MIIS
not lexicon::(?Yr.dlex).lf=yes;
  ]
  rightside = [
rc:?Yr {
  <=> ?Yl
  ATTR -> ?Zr{
    <=> ?Zl
  }
}
  ]
  correspondence = [

  ]
]
/*A rule to transfer the meta node TIME*/
Sem<=>DSynt transfer_rel_TIME : transfer_relation
[
  leftside = [
?Sp {
    sem=specifier
    main-> ?Xl {
  sem=TIME
  1-> ?Yl
  2-> ?Zl
    }
  }
  ]
  conditions = [
//added for MIIS
not lexicon::(?Yr.dlex).lf=yes;
  ]
  rightside = [
rc:?Yr {
  <=> ?Yl
  APPEND -> ?Zr{
    <=> ?Zl
  }
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_rel_lexicon : transfer_relation
[
  leftside = [
?Xl {
  ?r-> ?Yl
}
  ]
  conditions = [
lexicon::(?Xr.dlex).(?r);
not lexicon::(?Xr.dlex).(?r)=ATTR;
//added for MIIS
not lexicon::(?Xr.dlex).lf=yes;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  lexicon::(?Xr.dlex).(?r)-> rc:?Yr {
    <=> ?Yl
  }
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_rel_lexicon_lf : transfer_relation
[
  leftside = [
?Xl {
  ?r-> ?Yl
}
  ]
  conditions = [
lf::(?Xr.dlex).(?r);
not lf::(?Xr.dlex).(?r)=ATTR;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  lf::(?Xr.dlex).(?r)-> rc:?Yr {
    <=> ?Yl
  }
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_rel_lexicon_switch : transfer_relation
[
  leftside = [
?Xl {
  ?r-> ?Yl
}
  ]
  conditions = [
lexicon::(?Xr.dlex).(?r);
lexicon::(?Xr.dlex).(?r)=ATTR;
  ]
  rightside = [
rc:?Yr {
  <=> ?Yl
  lexicon::(?Xr.dlex).(?r)-> rc:?Xr {
    <=> ?Xl
  }
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt transfer_rel_recopy : transfer_relation
[
  leftside = [
?Xl {
  ?r-> ?Yl
}
  ]
  conditions = [
?r=COREF;
//added for MIIS
not lexicon::(?Xr.dlex).lf=yes;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  ?r-> rc:?Yr {
    <=> ?Yl
  }
}
  ]
  correspondence = [

  ]
]
/*This rule adds a relation between the main node of the relative clause (finite verb)
 and the noun that the relative clause modifies.
It also transfers the relative pronoun (since "transfer_node" does not apply to nodes with COREF).*/
Sem<=>DSynt transfer_relation_relativeClause : transfer_relation
[
  leftside = [
?S {
  sem=sentence
  perspective=backgrounded
  ?Rh {
    sem=rheme
    main-> ?Xl {
      ?r-> ?Yl {
        COREF-> ?Tl {}
      }
    }
  }
}
  ]
  conditions = [
lexicon::(?Xr.dlex).dpos=V;
  ]
  rightside = [
rc:?Tr {
  <=> ?Tl
  ATTR-> rc:?Xr {
    <=> ?Xl
    finiteness=FIN
  }
}
?Yr {
  <=> ?Yl
  dlex=der_2
  dpos=lexicon::(der_2).dpos
}
  ]
  correspondence = [

  ]
]
Sem<=>DSynt university_our : transfer_relation
[
  leftside = [
?Xl {
  1 -> ?Yl
}
  ]
  conditions = [
lexicon::(?Xr.dlex).spos = adjective;
  ]
  rightside = [
rc:?Yr {
  <=> ?Yl
  ATTR -> rc:?Xr {
    <=> ?Xl
  }
}
  ]
  correspondence = [

  ]
]