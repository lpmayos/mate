
DSynt<=>SSynt abstract transfer_attributes : rule
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
DSynt<=>SSynt abstract transfer_node : rule
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
DSynt<=>SSynt abstract transfer_relation : rule
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
DSynt<=>SSynt mark_specifier_verb : transfer_attributes
[
  leftside = [
?Xl {
  dpos=V
}
  ]
  conditions = [

  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  hasSpec=yes
  rc:adv-> rc:?Yr {
    rc:perspective=FORE
  }
}
  ]
  correspondence = [

  ]
]
/*Finite verbs with no established mood in the DSynt Str are assigned "Indicative" by default.*/
Sem<=>DSynt transfer_MOOD_default : transfer_attributes
[
  leftside = [
?Xl {
  finiteness=FIN
}
  ]
  conditions = [
not ?Xl.mood;
not ?N analyt_fut-> ?Xr;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  mood=IND
}
  ]
  correspondence = [

  ]
]
DSynt<=>SSynt transfer_attributes : transfer_attributes
[
  leftside = [
?Xl
  ]
  conditions = [
not ?Xl COREF-> ?N;	//in this case some attributes are taken from the coreferring element
not ?Xl.tense=FUT;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  spos=lexicon::(?Xl.dlex).spos
  gender=lexicon::(?Xl.dlex).gender
  number=?Xl.number
  finiteness=?Xl.finiteness
  voice=?Xl.voice
  person=lexicon::(?Xl.dlex).person
}
  ]
  correspondence = [

  ]
]
DSynt<=>SSynt transfer_attributes_COREF : transfer_attributes
[
  leftside = [
?Xl {
  COREF-> ?Yl
}
  ]
  conditions = [

  ]
  rightside = [
rc:?Yr {
  <=> ?Yl
  rc:gender=?g
  rc:number=?n
}
rc:?Xr {
  <=> ?Xl
  spos=lexicon::(?Xl.dlex).spos
  gender=?g
  number=?n
}
  ]
  correspondence = [

  ]
]
DSynt<=>SSynt transfer_case_governed : transfer_attributes
[
  leftside = [
?Xl {
  ?r-> ?Yl
}
  ]
  conditions = [
lexicon::(?Xl.dlex).(gp).(?r).(case);
  ]
  rightside = [
rc:?Yr {
  <=> ?Yl
  case=lexicon::(?Xl.dlex).(gp).(?r).(case)
}
  ]
  correspondence = [

  ]
]
/*Transfers bubbles.*/
DSynt<=>SSynt transfer_bubble_F : transfer_node
[
  leftside = [
?Sl {
  bubble=yes
  ?Xl
}
  ]
  conditions = [

  ]
  rightside = [
?Sr {
  <=> ?Sl
  rc:?Xr {<=> ?Xl}
  bubble=yes
  slex=?Sl.dlex
}
  ]
  correspondence = [

  ]
]
/*Transfers nodes which are not values of lexical functions.*/
DSynt<=>SSynt transfer_node : transfer_node
[
  leftside = [
?Xl {}
  ]
  conditions = [
not ?Xl.bubble;
not lf::(?Xl.dlex).dpos;
not ?Xl.tense=FUT;
not ?Xl.aspect=PERF;
  ]
  rightside = [
?Xr {
  <=> ?Xl
  slex=lexicon::(?Xl.dlex).lemma
  dpos=?Xl.dpos
  tense=?Xl.tense
  perspective=?Xl.perspective
}
  ]
  correspondence = [

  ]
]
/*Transfers nodes which are not values of lexical functions.*/
DSynt<=>SSynt disabled transfer_node_aspect_PERF : transfer_node
[
  leftside = [
?Xl {
  aspect=PERF
}
  ]
  conditions = [
not ?Xl.bubble;
not ?Xl.tense=FUT;
not lf::(?Xl.dlex).dpos;
  ]
  rightside = [
?Ar {
  <=> ?Xl
  slex=lexicon::(sein_2).lemma
  spos=lexicon::(sein_2).spos
  dpos=lexicon::(sein_2).dpos
  tense=PRES
  finiteness=FIN
  top=yes
  analyt_fut-> ?Xr {
    <=> ?Xl
    slex=lexicon::(?Xl.dlex).lemma
    spos=lexicon::(?Xl.dlex).spos
    dpos=?Xl.dpos
    finiteness=PART
    bottom=yes
  }
}
  ]
  correspondence = [

  ]
]
DSynt<=>SSynt transfer_node_det-DEF : transfer_node
[
  leftside = [
?Xl {
  dpos=N
}
  ]
  conditions = [
?Xl.definiteness=DEF;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  det-> ?Det {
    slex=lexicon::(the).lemma
    spos=lexicon::(the).spos
    dpos=lexicon::(the).dpos
  }
}
rc:?S {
  rc:bubble=yes
  rc:?Xr
  ?Det //add here new your new nodes
}
  ]
  correspondence = [

  ]
]
DSynt<=>SSynt transfer_node_det-INDEF : transfer_node
[
  leftside = [
?Xl {
  dpos=N
}
  ]
  conditions = [
?Xl.definiteness=INDEF;
not ?Xl ATTR-> ?Yl; 
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  det-> ?Det {
    slex=lexicon::(a).lemma
    spos=lexicon::(a).spos
    dpos=lexicon::(a).dpos
  }
}
rc:?S {
  rc:bubble=yes
  rc:?Xr
  ?Det //add here new your new nodes
}
  ]
  correspondence = [

  ]
]
/*Transfers nodes which are not values of lexical functions.*/
DSynt<=>SSynt transfer_node_tense_FUT : transfer_node
[
  leftside = [
?Xl {
  tense=FUT
  II -> ?Yl
}
  ]
  conditions = [
not ?Xl.bubble;
not ?Xl.aspect=PERF;
lf::(?Xl.dlex).dpos;
  ]
  rightside = [
?Ar {
  <=> ?Xl
  slex=lexicon::(will).lemma
  spos=lexicon::(will).spos
  dpos=lexicon::(will).dpos
  tense=PRES
  finiteness=FIN
  top=yes
  analyt_fut-> ?Xr {
    <=> ?Xl
    slex=lexicon::(lexicon::(?Yl.dlex).Oper1).lemma
    spos=lexicon::(lexicon::(?Yl.dlex).Oper1).spos
    dpos=?Xl.dpos
    finiteness=PART
    bottom=yes
  }
}
  ]
  correspondence = [

  ]
]
/*Transfers the relation ATTR below a verb (no mapping is provided in the lexicon).*/
DSynt<=>SSynt transfer_rel_adverbial : transfer_relation
[
  leftside = [
?Vl {
  dpos=V
  ATTR-> ?Yl {dpos=Adv}
}
  ]
  conditions = [
(not ?Vr.top=yes) or ?Yl.perspective=FORE;
not (?Yl.perspective=FORE and ?Vr.bottom=yes);
  ]
  rightside = [
rc:?Vr {
  <=> ?Vl
  adv-> rc:?Yr {
    <=> ?Yl
  }
}
  ]
  correspondence = [

  ]
]
/*Transfers a relation and adds the relevant governed preposition and its properties.*/
DSynt<=>SSynt transfer_rel_lexicon_govPrep : transfer_relation
[
  leftside = [
?Xl {
  ?r-> ?Yl
}
  ]
  conditions = [
//there is a preposition in the government pattern of the governor
lexicon::(?Xl.dlex).(gp).(?r).(prep);
//the dependent in the structure has the dpos required by the governor
?Yl.dpos=lexicon::(?Xl.dlex).(gp).(?r).(dpos);
//If the dependent is an auxiliated form, point to the top dep
not ?Yr.bottom=yes;
//If the governor is auxiliated, only the bottom gov can be governor
not ?Xr.top=yes;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  lexicon::(?Xl.dlex).(gp).(?r).(rel)-> ?Zr {
    <=> ?Xl
    bottom=yes
    slex=lexicon::(?Xl.dlex).(gp).(?r).(prep)
    spos=lexicon::(lexicon::(?Xl.dlex).(gp).(?r).(prep)).spos
    dpos=lexicon::(lexicon::(?Xl.dlex).(gp).(?r).(prep)).dpos
    prepos-> rc:?Yr {
      <=> ?Yl
    }
  }
}
rc:?S {
  rc:bubble=yes
  rc:?Xr rc:?Yr ?Zr 	//puts Z in the bubble
}
  ]
  correspondence = [

  ]
]
/*Transfers a relation which involves no governed preposition.*/
DSynt<=>SSynt transfer_rel_lexicon_govPrep_no : transfer_relation
[
  leftside = [
?Xl {
  ?r-> ?Yl
}
  ]
  conditions = [
//there is a mapping in the lexicon
lexicon::(?Xl.dlex).(gp).(?r);
//no preposition is required by the governor
not lexicon::(?Xl.dlex).(gp).(?r).(prep);
//Only attaches the subject to the finite verb (see transfer_node_tense_FUT)
not (lexicon::(?Xl.dlex).(gp).(?r).(rel)=subj and ?Xr.bottom=yes);
//If the dependent is an auxiliated form, point to the top dep
not ?Yr.bottom=yes;
//If the governor is auxiliated, only the bottom gov can be governor (except for subj)
not (?Xr.top=yes and not lexicon::(?Xl.dlex).(gp).(?r).(rel)=subj);
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  lexicon::(?Xl.dlex).(gp).(?r).(rel)-> rc:?Yr {
      <=> ?Yl
  }
}
  ]
  correspondence = [

  ]
]
/*Transfers the relation ATTR between a noun and a finite verb (no mapping is provided in the lexicon).*/
DSynt<=>SSynt transfer_rel_relat : transfer_relation
[
  leftside = [
?Xl {
  dpos=N
  ATTR-> ?Yl {
    dpos=V
    finiteness=FIN
  }
}
  ]
  conditions = [

  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  relat-> rc:?Yr {
    <=> ?Yl
  }
}
  ]
  correspondence = [

  ]
]