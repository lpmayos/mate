
SSynt<=>DMorph abstract agreement : rule
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
SSynt<=>DMorph abstract order_nodes : rule
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
SSynt<=>DMorph abstract transfer_nodes : rule
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
SSynt<=>DMorph copul_agreement : agreement
[
  leftside = [
?Xl {
  dpos=V
  subj-> ?Yl {}
  copul-> ?Zl {}
}
  ]
  conditions = [
not ?Xr.bubble;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  number=?Yl.number
  gender=?Yl.gender
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph morph_agree_N_dep : agreement
[
  leftside = [
?Xss {
  ?r-> ?Yss {}
}
  ]
  conditions = [
not ?Ydm.bubble;
?r=det;
  ]
  rightside = [
rc:?Ydm{
  <=> ?Yss
  gender=?Xss.gender
  num=?Xss.num
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph verb_agreement : agreement
[
  leftside = [
?Xl {
  dpos=V
  subj-> ?Yl {}
}
  ]
  conditions = [
not ?Xr.bubble;
  ]
  rightside = [
rc:?Xr {
  <=> ?Xl
  person=?Yl.person
  number=?Yl.number
}
  ]
  correspondence = [

  ]
]
/*//These rules linearize siblings among themselves.*/
SSynt<=>DMorph abstract order_horizontal : order_nodes
[
  leftside = [
//These rules linearize siblings among themselves.
  ]
  conditions = [
//These rules linearize siblings among themselves.
  ]
  rightside = [
//These rules linearize siblings among themselves.
  ]
  correspondence = [

  ]
]
/*//These rules linearize governor with respect to dependents.*/
SSynt<=>DMorph abstract order_vertical : order_nodes
[
  leftside = [
//These rules linearize governor with respect to dependents.
  ]
  conditions = [
//These rules linearize governor with respect to dependents.
  ]
  rightside = [
//These rules linearize governor with respect to dependents.
  ]
  correspondence = [

  ]
]
/*Puts the bubble corresponding to a dependent Y of a non-V node X on LS into the bubble
corresponding to X on RS.
?XP is already built by "bubble_node" rule but is not "rc:",
otherwise this kind of rule doesn't work.

condition: (?Yss.dpos=V and ?YP.slex=verb_group and not ?Yss subj-> ?N)
is for allowing "for V-ing"may interfere with normal sentences???
needs testing*/
SSynt<=>DMorph bubbles_dep : transfer_nodes
[
  leftside = [
?Xss {
  ?r-> ?Yss {}
}
  ]
  conditions = [
not ?Xss.slex=S;
not (?Xss.dpos=V and ?Xss.finiteness=FIN);
(?YP.slex=?Yss.spos and not ?Yss.dpos=V) or (?Yss.dpos=V and ?YP.slex=clause);
not (?Yss.dpos=Adv and ?Yss.perspective=FORE);
  ]
  rightside = [
?XP {
  <=> ?Xss
  bubble=yes
  slex=?Xss.spos
  rc:?YP {
    <=> ?Yss
    rc:bubble=yes
  }
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph bubbles_node : transfer_nodes
[
  leftside = [
?Xss {}
  ]
  conditions = [
?Xss.spos;
not ?Xss.slex=S;
not ?Xss.slex=C;
  ]
  rightside = [
?XP {
  <=>?Xss
  bubble=yes
  slex=?Xss.spos
//  n=:j
  ?Xdm {
    <=>?Xss
      slex=?Xss.slex
      spos=?Xss.spos
      number=?Xss.number
      gender=?Xss.gender
      mood=?Xss.mood
      tense=?Xss.tense
      case=?Xss.case
  }
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph abstract verb_group : transfer_nodes
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
SSynt<=>DMorph order_H_adv_embedded : order_horizontal
[
  leftside = [
?Xss {
  dpos=V
  ?r-> ?Zss {}
  adv-> ?Yss {}
}
  ]
  conditions = [
not ?Ydm.bubble;
not ?Zdm.bubble;
?N ?s-> ?Xss;	//?Xss is embedded
not ?Yss.slex=noch;
  ]
  rightside = [
rc:?Ydm { <=> ?Yss
  b-> rc:?Zdm { <=> ?Zss }
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph disabled order_H_adv_fore : order_horizontal
[
  leftside = [
?Xss {
  dpos=V
  adv-> ?Yss {}
  ?r-> ?Zss {}
}
  ]
  conditions = [
not ?Ydm.bubble;
not ?Zdm.bubble;
?Yss.perspective=FORE;
  ]
  rightside = [
rc:?Ydm { <=> ?Yss
  b-> rc:?Zdm { <=> ?Zss }
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph order_H_adv_regular : order_horizontal
[
  leftside = [
?Xss {
  dpos=V
  ?r-> ?Yss {}
  adv-> ?Zss {}
}
  ]
  conditions = [
not ?Ydm.bubble;
not ?Zdm.bubble;
not ?N ?s-> ?Xss;	//?Xss is not embedded
not ?Zss.perspective=FORE;
not ?Yss.slex=noch;
  ]
  rightside = [
rc:?Ydm { <=> ?Yss
  b-> rc:?Zdm { <=> ?Zss }
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph order_H_dobj-iobj : order_horizontal
[
  leftside = [
?Xss {
  dpos=V
  iobj-> ?Yss {}
  dobj-> ?Zss {}
}
  ]
  conditions = [
not ?Ydm.bubble;
not ?Zdm.bubble;
not ?Zss.spos=relative_pronoun;	//relative pronoun is always before the siblings
  ]
  rightside = [
rc:?Ydm { <=> ?Yss
  b-> rc:?Zdm { <=> ?Zss }
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph order_H_relatPro : order_horizontal
[
  leftside = [
?Xss {
  dpos=V
  ?r-> ?Yss {spos=relative_pronoun}
  ?s-> ?Zss {}
}
  ]
  conditions = [
not ?Ydm.bubble;
not ?Zdm.bubble;
  ]
  rightside = [
rc:?Ydm { <=> ?Yss
  b-> rc:?Zdm { <=> ?Zss }
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph order_H_subj : order_horizontal
[
  leftside = [
?Xss {
  dpos=V
  subj-> ?Yss {}
  ?r-> ?Zss {}
}
  ]
  conditions = [
not ?Ydm.bubble;
not ?Zdm.bubble;
not ?Zss.spos=relative_pronoun;	//relative pronoun is always before the siblings
not ?Zss.perspective=FORE;
//?r=iobj or ?r=dobj or ?r=adv or ?r=copul or ?r=analyt_fut;
  ]
  rightside = [
rc:?Ydm { <=> ?Yss
  b-> rc:?Zdm { <=> ?Zss }
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph order_V_XY : order_vertical
[
  leftside = [
?Xss { 
  ?r-> ?Yss {}
}
  ]
  conditions = [
not ?Xdm.bubble;
not ?Ydm.bubble;
not ?Yss.spos=relative_pronoun;	//relative pronoun is always before the siblings
not (?Xss.dpos=V and ?N ?s-> ?Xss); // if the verb is embedded, it goes at the end
?r=attr or (?r=adv and not ?Xss.hasSpec=yes) or ?r=prepos or ?r=dobj or ?r=iobj or ?r=relat or ?r=copul
 or (?Xss.spos=auxiliary and ?Yss.spos=verb and not ?N ?s-> ?Xss)
 or (?r=subj and ?Xss.hasSpec=yes);
  ]
  rightside = [
rc:?Xdm { <=> ?Xss
  b-> rc:?Ydm { <=> ?Yss }
}
  ]
  correspondence = [

  ]
]
SSynt<=>DMorph order_V_YX : order_vertical
[
  leftside = [
?Xss { 
  ?r-> ?Yss {}
}
  ]
  conditions = [
not ?Xdm.bubble;
not ?Ydm.bubble;
?r=det or (?r=subj and not ?Xss.hasSpec=yes) or (?Xss.spos=auxiliary and ?Yss.spos=verb and ?N ?s-> ?Xss)
 or (?Xss.dpos=V and ?N ?s-> ?Xss) or (?r=adv and ?Yss.perspective=FORE and ?Xss.hasSpec=yes);
  ]
  rightside = [
rc:?Xdm { <=> ?Yss
  b-> rc:?Ydm { <=> ?Xss }
}
  ]
  correspondence = [

  ]
]
/*This rule puts the direct dependents of a main verb into the "clause" bubble:
Puts the bubble corresponding to a dependent Y of a V-node X on LS into the bubble
corresponding to X on RS.
The bubble that corresponds to ?Yss already exists on the right side but ?YP cannot be "rc:" otherwise this rule doesn't work.
MATE unifies the nodes built here with the node built by the bubble_node rule.*/
SSynt<=>DMorph bubbles_clause_dep : verb_group
[
  leftside = [
?Xss {
  dpos=V
  ?r-> ?Yss
}
  ]
  conditions = [
not (?Yss.dpos=V and ?Yss.finiteness=FIN);
  ]
  rightside = [
rc:?VG {
  <=> ?Xss
  rc:bubble=yes
  rc:slex=clause
  ?YP {
    <=> ?Yss
    bubble=yes
    slex=?Yss.spos
  }
}
  ]
  correspondence = [

  ]
]
/*This rule puts all deps of the members of verb_group into the "clause" bubble:
Puts the bubble corresponding to a dependent Y of a V-node X on LS into the bubble
corresponding to X on RS.*/
SSynt<=>DMorph bubbles_clause_dep_deps : verb_group
[
  leftside = [
?Xss {
  ?r-> ?Yss
}
  ]
  conditions = [
not (?Yss.dpos=V and ?Yss.finiteness=FIN);
  ]
  rightside = [
rc:?VG {
  rc:bubble=yes
  rc:slex=clause
  rc:?XP {
    <=> ?Xss
    rc:bubble=yes
  }
  rc:+?YP {
    <=> ?Yss
    rc:bubble=yes
  }
}
  ]
  correspondence = [

  ]
]
/*Builds a bubble "verb_group" around the top V node.*/
SSynt<=>DMorph bubbles_clause_vgroup : verb_group
[
  leftside = [
?Xss {
  dpos=V
  finiteness=FIN
}
  ]
  conditions = [

  ]
  rightside = [
?C {
  <=> ?Xss
  bubble=yes
  slex=clause
  ?VG {
  <=> ?Xss
  bubble=yes
  slex=verb_group
  rc:?XP {
    <=> ?Xss
    rc:bubble=yes
    rc:slex=?Xss.spos
  }
}
}
  ]
  correspondence = [

  ]
]