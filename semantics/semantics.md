Unit-B Models

Syntax
======

    MACHINE M
    VARIABLES v
    INVARIANT i.v
    INITIALISATION init.v
    
    EVENTS

    e =
    ANY t WHERE
      g.t.v
    DURING
      c.t.v
    UPON
      f.t.v
    THEN
      s.t.v.v'
    END

Semantics
=========

    (Ex_def)    [ Ex.M ≡ saf.M ∧ live.M ]
    (saf_def)   [ saf.M ≡ •init.v ∧ G (step.M;true) ]
    (step_def)  [ step.M ≡ ⟨∃e,t: e.t ∈ M : act.(e.t)⟩ ∨ SKIP ]
    (act_def)   [ act.(e.t) ≡ g.t;S.t ]
    (S_def)     [ S.t ≡ ⟨∀x :: •(x = v) ⇒ X;s.t.x.v⟩ ]
    (live_def)  [ live.M ≡ ⟨∀e,t: e.t ∈ M : sched.(e.t)⟩ ]
    (sched_def) [ sched.(e.t) ≡ G (G •c ∧ G F;•f  ⇒  F;f;act.(e.t);true) ]

Properties
==========
    (un_def) [ (p un q) ≡ G (•p ⇒ (G •p);(1 ∨ X);•q)]

    (un_thm)
      ⟨∀e,t: e.t ∈ M : G((p ∧ ∼q);act.(e.t);true ⇒ X;(p ∨ q);true)⟩
    ⇒
      [ex.M  ⇒  p un q]

    (leadsto_def) [ (p → q) ≡ G (•p ⇒ F;•q) ]

Invariants
----------
      [Ex.M ⇒ G •i.v]
    ⇐ { Sem.1 }
      [saf.M ⇒ G •i.v]
    ⇐ { Invariant principle }
      [init.v ⇒ i.v] ∧ [⟨∀e,t : e.t ∈ M : i.v;act.(e.t) ⇒ X;i.v ⟩]


Refinements
===========

`M` has external variables `av`, and internal variables `aw`
`N` has external variables `cv`, and internal variables `cw`
External variables are glued together by external invariant `j.cv.av`

Internal invariants `J.cw.cv.aw.av` subsume external invariant i.e.,
     [ J.cw.cv.aw.av  ⇒ j.cv.av ]


Refinement rule
    (Ref_def) [ ⟨∃cw :: Ex.N⟩  ⇒ ⟨∃av:: ⟨∃aw::Ex.M⟩ ∧ j.cv.av⟩]
      

Proposal
       (Ref_def)
     ≡
       [ ⟨∃cw :: Ex.N⟩  ⇒ ⟨∃av:: ⟨∃aw::Ex.M⟩ ∧ j.cv.av⟩ ]
     ⇐ { Logic }
       [ Ex.N  ⇒ ⟨∃av:: ⟨∃aw::Ex.M⟩ ∧ j.cv.av⟩ ]
     ⇐ { [ J.cv.cw.cv.av  ⇒  j.cv.av ] }
       [ Ex.N  ⇒ ⟨∃av,aw:: Ex.M ∧ J.cw.cv.aw.av⟩ ]
     ≡ { Ex_def }
       [ saf.N ∧ live.N  ⇒ ⟨∃av,aw:: saf.M ∧ live.M ∧ J.cw.cv.aw.av⟩ ]
     ⇐ { Logic }
       [ saf.N ⇒ ⟨∃av,aw:: saf.M ∧ J.cw.cv.aw.av⟩ ] ∧         ---- (Ref.1)
       [ saf.N ∧ saf.M ∧ J.cw.cv.aw.av ∧ live.N ⇒ live.M ]   ---- (Ref.2)

     
       (Ref.1)
     ≡
       [ saf.N ⇒ ⟨∃av,aw:: saf.M ∧ J.cw.cv.aw.av⟩ ]
     ⇐ { saf_def }
       [ •initN.cw.cv ∧ G (step.N;true) ⇒ ⟨∃av,aw:: initM.aw.av ∧ G (step.M;true) ∧ J.cw.cv.aw.av⟩ ]
     ⇐  
