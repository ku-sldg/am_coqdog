(* Encoding of our EECS762 Lecture exercises in Coq*)
(*###Start-Here###*)

Require Export String.

Inductive pterm : Type :=
    | ptrue : pterm
    | pfalse : pterm
    | pif (c t e : pterm)
    | pz : pterm
    | psucc (t : pterm)
    | ppred (t : pterm)
    | isZero (t : pterm).

Fixpoint pterms (t : pterm) : nat :=
    match t with
    | ptrue => 1
    | pfalse => 1
    | pif c t e => pterms c + pterms t + pterms e + 1
    | pz => 1
    | psucc t => pterms t + 1
    | ppred t => pterms t + 1
    | isZero t => pterms t + 1
    end.

(*
Compute pterms (pif (isZero (psucc pz)) (ptrue) (pfalse)).
*)

Inductive Vvalue : Type :=
    | vtrue
    | vfalse.

Inductive Vterms : Type :=
    | value (v : Vvalue)
    | vif (t t t : Vterms).

Inductive Veval : Vterms -> Vterms -> Prop :=
    | eval_iftrue : forall (t1 t2 : Vterms), 
        Veval (vif (value vtrue) (t1) (t2)) (t1)
    | eval_iffalse : forall (t1 t2 : Vterms), 
        Veval (vif (value vfalse) (t1) (t2)) (t2)
    | eval_if : forall (c c' t e : Vterms), 
        Veval c c' -> Veval (vif c t e) (vif c' t e).

Notation "t -->(Veval) t'" := (Veval t t') (at level 65, right associativity).


(*###Stop-Here###*)
Example Veval_iftrue : 
    Veval (vif (value vtrue) (value vfalse) (value vtrue)) (value vfalse).
Proof.
Admitted.
