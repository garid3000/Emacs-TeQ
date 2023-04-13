(require 'quail)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun quail-func-init ()
  (quail-delete-region)
  (setq quail-current-str nil
	quail-converting nil
	quail-conversion-str ""))

(defun quail-func-end ()
  (throw 'quail-tag nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun quail-TeQ-equation (key idx)
  (quail-func-init)
  (insert "\\begin{equation}\n\n\\end{equation}")
  (previous-line)
  (quail-func-end))

(defun quail-TeQ-aligned (key idx)
  (quail-func-init)
  (insert "\\begin{aligned}\n\n\\end{aligned}")
  (previous-line)
  (quail-func-end))

(defun quail-TeQ-endofline (key idx)
  (quail-func-init)
  (end-of-line)
  (insert "\\\\\n")
  (quail-func-end))

(defun quail-TeQ-next (key idx)
  (quail-func-init)
  (evil-find-char 1 32)
  (quail-func-end))

(defun quail-TeQ-prev (key idx)
  (quail-func-init)
  (evil-find-char-backward 1 32)
  (quail-func-end))

(defun quail-TeQ-frac (key idx)
  (quail-func-init)

  (backward-sexp) (kill-sexp)
  (if (looking-back "[a-zA-Z]" 0)
      (progn
	(backward-word)
	(if (= (preceding-char) ?\\ )
	    (progn (message "yes") (kill-word 1)
		   (backward-delete-char 1) (insert "\\frac{\\")
		   (yank 1) (yank 2) (insert "}{}"))
	  (progn (message "no") (forward-word)
		 (insert "\\frac{") (yank) (insert "}{}")))
	)
    (progn (message "no")
					;(forward-word)
	   (insert "\\frac{") (yank) (insert "}{}"))
    )
  (backward-char)

  (quail-func-end))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(quail-define-package
 "TeQ-Math" "Emacs-Teq-Latex"  "TeQ-" t
 "TeQ-Math input"
 nil t t t t nil nil nil nil nil t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(quail-define-rules
    ;; Greek Alphabets
    ;; Greek
    ("a."     ["\\alpha"        ])  ("A."     ["A"              ])
    ("b."     ["\\beta"         ])  ("B."     ["B"              ])
    ("c."     ["\\psi"          ])  ("C."     ["\\Psi"          ])
    ("d."     ["\\delta"        ])  ("D."     ["\\Delta"        ])
    ("e."     ["\\epsilon"      ])  ("E."     ["E"              ])
    ("f."     ["\\phi"          ])  ("F."     ["\\Phi"          ])
    ("g."     ["\\gamma"        ])  ("G."     ["\\Gamma"        ])
    ("h."     ["\\eta"          ])  ("H."     ["H"              ])
    ("i."     ["\\iota"         ])  ("I."     ["I"              ])
    ("j."     ["\\xi"           ])  ("J."     ["\\Xi"           ])
    ("k."     ["\\kappa"        ])  ("K."     ["K"              ])
    ("l."     ["\\lambda"       ])  ("L."     ["\\Lambda"       ])
    ("m."     ["\\mu"           ])  ("M."     ["M"              ])
    ("n."     ["\\nu"           ])  ("N."     ["N"              ])
    ("o."     ["o"              ])  ("O."     ["O"              ])
    ("p."     ["\\pi"           ])  ("P."     ["\\Pi"           ])
    ("r."     ["\\rho"          ])  ("R."     ["P"              ])
    ("s."     ["\\sigma"        ])  ("S."     ["\\Sigma"        ])
    ("t."     ["\\tau"          ])  ("T."     ["T"              ])
    ("th."    ["\\theta"        ])  ("Th."    ["\\Theta"        ])
    ("u."     ["\\upsilon"      ])  ("U."     ["\\Upsilon"      ])
    ("w."     ["\\omega"        ])  ("W."     ["\\Omega"        ])
    ("x."     ["\\chi"          ])  ("X."     ["X"              ])
    ("z."     ["\\zeta"         ])  ("Z."     ["Z"              ])
    ("e.."    ["\\varepsilon"   ])  ("r.."    ["\\varrho"       ])
    ("f.."    ["\\varphi"       ])  ("p.."    ["\\varpi"        ])
    ("s.."    ["\\varsigma"     ])  ("t.."    ["\\vartheta"     ])
    ;; Matrix
    ("Am"     ["\\mathbf{A}"    ])  ("am"     ["\\mathbf{a}"    ])
    ("Bm"     ["\\mathbf{B}"    ])  ("bm"     ["\\mathbf{b}"    ])
    ("Cm"     ["\\mathbf{C}"    ])  ("cm"     ["\\mathbf{c}"    ])
    ("Dm"     ["\\mathbf{D}"    ])  ("dm"     ["\\mathbf{d}"    ])
    ("Em"     ["\\mathbf{E}"    ])  ("em"     ["\\mathbf{e}"    ])
    ("Fm"     ["\\mathbf{F}"    ])  ("fm"     ["\\mathbf{f}"    ])
    ("Gm"     ["\\mathbf{G}"    ])  ("gm"     ["\\mathbf{g}"    ])
    ("Hm"     ["\\mathbf{H}"    ])  ("hm"     ["\\mathbf{h}"    ])
    ("Im"     ["\\mathbf{I}"    ])  ("im"     ["\\mathbf{i}"    ])
    ("Jm"     ["\\mathbf{J}"    ])  ("jm"     ["\\mathbf{j}"    ])
    ("Km"     ["\\mathbf{K}"    ])  ("km"     ["\\mathbf{k}"    ])
    ("Lm"     ["\\mathbf{L}"    ])  ("lm"     ["\\mathbf{l}"    ])
    ("Mm"     ["\\mathbf{M}"    ])  ("mm"     ["\\mathbf{m}"    ])
    ("Nm"     ["\\mathbf{N}"    ])  ("nm"     ["\\mathbf{n}"    ])
    ("Om"     ["\\mathbf{O}"    ])  ("om"     ["\\mathbf{o}"    ])
    ("Pm"     ["\\mathbf{P}"    ])  ("pm"     ["\\mathbf{p}"    ])
    ("Qm"     ["\\mathbf{Q}"    ])  ("qm"     ["\\mathbf{q}"    ])
    ("Rm"     ["\\mathbf{R}"    ])  ("rm"     ["\\mathbf{r}"    ])
    ("Sm"     ["\\mathbf{S}"    ])  ("sm"     ["\\mathbf{s}"    ])
    ("Tm"     ["\\mathbf{T}"    ])  ("tm"     ["\\mathbf{t}"    ])
    ("Um"     ["\\mathbf{U}"    ])  ("um"     ["\\mathbf{u}"    ])
    ("Vm"     ["\\mathbf{V}"    ])  ("vm"     ["\\mathbf{v}"    ])
    ("Wm"     ["\\mathbf{W}"    ])  ("wm"     ["\\mathbf{w}"    ])
    ("Xm"     ["\\mathbf{X}"    ])  ("xm"     ["\\mathbf{x}"    ])
    ("Ym"     ["\\mathbf{Y}"    ])  ("ym"     ["\\mathbf{y}"    ])
    ("Zm"     ["\\mathbf{Z}"    ])  ("zm"     ["\\mathbf{z}"    ])
    ("Om"     ["\\mathbf{0}"    ])  ("0m"     ["\\mathbf{0}"    ])
    ;; Vector & Hat
    ("Av"     ["\\vec{A}"       ])  ("av"     ["\\vec{a}"       ])
    ("Bv"     ["\\vec{B}"       ])  ("bv"     ["\\vec{b}"       ])
    ("Cv"     ["\\vec{C}"       ])  ("cv"     ["\\vec{c}"       ])
    ("Dv"     ["\\vec{D}"       ])  ("dv"     ["\\vec{d}"       ])
    ("Ev"     ["\\vec{E}"       ])  ("ev"     ["\\vec{e}"       ])
    ("Fv"     ["\\vec{F}"       ])  ("fv"     ["\\vec{f}"       ])
    ("Gv"     ["\\vec{G}"       ])  ("gv"     ["\\vec{g}"       ])
    ("Hv"     ["\\vec{H}"       ])  ("hv"     ["\\vec{h}"       ])
    ("Iv"     ["\\vec{I}"       ])  ("iv"     ["\\vec{i}"       ])
    ("Jv"     ["\\vec{J}"       ])  ("jv"     ["\\vec{j}"       ])
    ("Kv"     ["\\vec{K}"       ])  ("kv"     ["\\vec{k}"       ])
    ("Lv"     ["\\vec{L}"       ])  ("lv"     ["\\vec{l}"       ])
    ("Mv"     ["\\vec{M}"       ])  ("mv"     ["\\vec{m}"       ])
    ("Nv"     ["\\vec{N}"       ])  ("nv"     ["\\vec{n}"       ])
    ("Ov"     ["\\vec{O}"       ])  ("ov"     ["\\vec{o}"       ])
    ("Pv"     ["\\vec{P}"       ])  ("pv"     ["\\vec{p}"       ])
    ("Qv"     ["\\vec{Q}"       ])  ("qv"     ["\\vec{q}"       ])
    ("Rv"     ["\\vec{R}"       ])  ("rv"     ["\\vec{r}"       ])
    ("Sv"     ["\\vec{S}"       ])  ("sv"     ["\\vec{s}"       ])
    ("Tv"     ["\\vec{T}"       ])  ("tv"     ["\\vec{t}"       ])
    ("Uv"     ["\\vec{U}"       ])  ("uv"     ["\\vec{u}"       ])
    ("Vv"     ["\\vec{V}"       ])  ("vv"     ["\\vec{v}"       ])
    ("Wv"     ["\\vec{W}"       ])  ("wv"     ["\\vec{w}"       ])
    ("Xv"     ["\\vec{X}"       ])  ("xv"     ["\\vec{x}"       ])
    ("Yv"     ["\\vec{Y}"       ])  ("yv"     ["\\vec{y}"       ])
    ("Zv"     ["\\vec{Z}"       ])  ("zv"     ["\\vec{z}"       ])
    ;; Vector & Hat
    ("Ah"     ["\\hat{A}"       ])  ("ah"     ["\\hat{a}"       ])
    ("Bh"     ["\\hat{B}"       ])  ("bh"     ["\\hat{b}"       ])
    ("Ch"     ["\\hat{C}"       ])  ("ch"     ["\\hat{c}"       ])
    ("Dh"     ["\\hat{D}"       ])  ("dh"     ["\\hat{d}"       ])
    ("Eh"     ["\\hat{E}"       ])  ("eh"     ["\\hat{e}"       ])
    ("Fh"     ["\\hat{F}"       ])  ("fh"     ["\\hat{f}"       ])
    ("Gh"     ["\\hat{G}"       ])  ("gh"     ["\\hat{g}"       ])
    ("Hh"     ["\\hat{H}"       ])  ("hh"     ["\\hat{h}"       ])
    ("Ih"     ["\\hat{I}"       ])  ("ih"     ["\\hat{i}"       ])
    ("Jh"     ["\\hat{J}"       ])  ("jh"     ["\\hat{j}"       ])
    ("Kh"     ["\\hat{K}"       ])  ("kh"     ["\\hat{k}"       ])
    ("Lh"     ["\\hat{L}"       ])  ("lh"     ["\\hat{l}"       ])
    ("Mh"     ["\\hat{M}"       ])  ("mh"     ["\\hat{m}"       ])
    ("Nh"     ["\\hat{N}"       ])  ("nh"     ["\\hat{n}"       ])
    ("Oh"     ["\\hat{O}"       ])  ("oh"     ["\\hat{o}"       ])
    ("Ph"     ["\\hat{P}"       ])  ("ph"     ["\\hat{p}"       ])
    ("Qh"     ["\\hat{Q}"       ])  ("qh"     ["\\hat{q}"       ])
    ("Rh"     ["\\hat{R}"       ])  ("rh"     ["\\hat{r}"       ])
    ("Sh"     ["\\hat{S}"       ])  ("sh"     ["\\hat{s}"       ])
    ("Th"     ["\\hat{T}"       ])  ("th"     ["\\hat{t}"       ])
    ("Uh"     ["\\hat{U}"       ])  ("uh"     ["\\hat{u}"       ])
    ("Vh"     ["\\hat{V}"       ])  ("vh"     ["\\hat{v}"       ])
    ("Wh"     ["\\hat{W}"       ])  ("wh"     ["\\hat{w}"       ])
    ("Xh"     ["\\hat{X}"       ])  ("xh"     ["\\hat{x}"       ])
    ("Yh"     ["\\hat{Y}"       ])  ("yh"     ["\\hat{y}"       ])
    ("Zh"     ["\\hat{Z}"       ])  ("zh"     ["\\hat{z}"       ])
    ;; Dot
    ("ad"     ["\\dot{a}"       ])  ("Ad"     ["\\dot{A}"       ])
    ("bd"     ["\\dot{b}"       ])  ("Bd"     ["\\dot{B}"       ])
    ("cd"     ["\\dot{c}"       ])  ("Cd"     ["\\dot{C}"       ])
    ("dd"     ["\\dot{d}"       ])  ("Dd"     ["\\dot{D}"       ])
    ("ed"     ["\\dot{e}"       ])  ("Ed"     ["\\dot{E}"       ])
    ("fd"     ["\\dot{f}"       ])  ("Fd"     ["\\dot{F}"       ])
    ("gd"     ["\\dot{g}"       ])  ("Gd"     ["\\dot{G}"       ])
    ("hd"     ["\\dot{h}"       ])  ("Hd"     ["\\dot{H}"       ])
    ("id"     ["\\dot{i}"       ])  ("Id"     ["\\dot{I}"       ])
    ("jd"     ["\\dot{j}"       ])  ("Jd"     ["\\dot{J}"       ])
    ("kd"     ["\\dot{k}"       ])  ("Kd"     ["\\dot{K}"       ])
    ("ld"     ["\\dot{l}"       ])  ("Ld"     ["\\dot{L}"       ])
    ("md"     ["\\dot{m}"       ])  ("Md"     ["\\dot{M}"       ])
    ("nd"     ["\\dot{n}"       ])  ("Nd"     ["\\dot{N}"       ])
    ("od"     ["\\dot{o}"       ])  ("Od"     ["\\dot{O}"       ])
    ("pd"     ["\\dot{p}"       ])  ("Pd"     ["\\dot{P}"       ])
    ("qd"     ["\\dot{q}"       ])  ("Qd"     ["\\dot{Q}"       ])
    ("rd"     ["\\dot{r}"       ])  ("Rd"     ["\\dot{R}"       ])
    ("sd"     ["\\dot{s}"       ])  ("Sd"     ["\\dot{S}"       ])
    ("td"     ["\\dot{t}"       ])  ("Td"     ["\\dot{T}"       ])
    ("ud"     ["\\dot{u}"       ])  ("Ud"     ["\\dot{U}"       ])
    ("vd"     ["\\dot{v}"       ])  ("Vd"     ["\\dot{V}"       ])
    ("wd"     ["\\dot{w}"       ])  ("Wd"     ["\\dot{W}"       ])
    ("xd"     ["\\dot{x}"       ])  ("Xd"     ["\\dot{X}"       ])
    ("yd"     ["\\dot{y}"       ])  ("Yd"     ["\\dot{Y}"       ])
    ("zd"     ["\\dot{z}"       ])  ("Zd"     ["\\dot{Z}"       ])
    ;; DDot
    ("add"    ["\\ddot{a}"      ])  ("Add"    ["\\ddot{A}"      ])
    ("bdd"    ["\\ddot{b}"      ])  ("Bdd"    ["\\ddot{B}"      ])
    ("cdd"    ["\\ddot{c}"      ])  ("Cdd"    ["\\ddot{C}"      ])
    ("ddd"    ["\\ddot{d}"      ])  ("Ddd"    ["\\ddot{D}"      ])
    ("edd"    ["\\ddot{e}"      ])  ("Edd"    ["\\ddot{E}"      ])
    ("fdd"    ["\\ddot{f}"      ])  ("Fdd"    ["\\ddot{F}"      ])
    ("gdd"    ["\\ddot{g}"      ])  ("Gdd"    ["\\ddot{G}"      ])
    ("hdd"    ["\\ddot{h}"      ])  ("Hdd"    ["\\ddot{H}"      ])
    ("idd"    ["\\ddot{i}"      ])  ("Idd"    ["\\ddot{I}"      ])
    ("jdd"    ["\\ddot{j}"      ])  ("Jdd"    ["\\ddot{J}"      ])
    ("kdd"    ["\\ddot{k}"      ])  ("Kdd"    ["\\ddot{K}"      ])
    ("ldd"    ["\\ddot{l}"      ])  ("Ldd"    ["\\ddot{L}"      ])
    ("mdd"    ["\\ddot{m}"      ])  ("Mdd"    ["\\ddot{M}"      ])
    ("ndd"    ["\\ddot{n}"      ])  ("Ndd"    ["\\ddot{N}"      ])
    ("odd"    ["\\ddot{o}"      ])  ("Odd"    ["\\ddot{O}"      ])
    ("pdd"    ["\\ddot{p}"      ])  ("Pdd"    ["\\ddot{P}"      ])
    ("qdd"    ["\\ddot{q}"      ])  ("Qdd"    ["\\ddot{Q}"      ])
    ("rdd"    ["\\ddot{r}"      ])  ("Rdd"    ["\\ddot{R}"      ])
    ("sdd"    ["\\ddot{s}"      ])  ("Sdd"    ["\\ddot{S}"      ])
    ("tdd"    ["\\ddot{t}"      ])  ("Tdd"    ["\\ddot{T}"      ])
    ("udd"    ["\\ddot{u}"      ])  ("Udd"    ["\\ddot{U}"      ])
    ("vdd"    ["\\ddot{v}"      ])  ("Vdd"    ["\\ddot{V}"      ])
    ("wdd"    ["\\ddot{w}"      ])  ("Wdd"    ["\\ddot{W}"      ])
    ("xdd"    ["\\ddot{x}"      ])  ("Xdd"    ["\\ddot{X}"      ])
    ("ydd"    ["\\ddot{y}"      ])  ("Ydd"    ["\\ddot{Y}"      ])
    ("zdd"    ["\\ddot{z}"      ])  ("Zdd"    ["\\ddot{Z}"      ])
    ;; Expanding Func
    ("/"       quail-TeQ-frac        )  ; fraction on previous
    ("eq"      quail-TeQ-equation    )  ; equation environment
    ("al"      quail-TeQ-aligned     )  ; aligned environment
    ("el"      quail-TeQ-endofline   )  ; end of line
    ("gg"      quail-TeQ-next        )  ; go to next space
    ("GG"      quail-TeQ-prev        )  ; go to prev space
    ;; Symbols-dots
    ("..."     ["\\dots"              ])  ; 3 dots
    (".v"      ["\\vdots"             ])  ; vertical dots
    (".d"      ["\\ddots"             ])  ; diagonale dots
    (".l"      ["\\ldots"             ])  ; low dots
    ;; Symbols-geo
    ("perp"    ["\\perp"              ])  ; 
    ("perpn"   ["\\not\\perp"         ])  ; $\perp$  ~n~ (neg)
    ("para"    ["\\parallel"          ])  ; 
    ("paran"   ["\\nparallel"         ])  ; $\parallel$ ~n~  (neg)
    ("ang"     ["\\angle"             ])  ; 
    ("ang."    ["\\measuredangle"     ])  ; $\angle$ ~.~ (var)
    ("tri"     ["\\vartriangle"       ])  ; 
    ("trin"    ["\\triangledown"      ])  ; $\vartriangle$ ~n~ (neg)
    ("squ"     ["\\square"            ])  ; 
    ("tri."    ["\\blacktriangle"     ])  ; $\vartriangle$ ~.~ (var)
    ("trin."   ["\\blacktriangledown" ])  ; $\vartriangle$ ~n.~ (neg,var)
    ("squ."    ["\\blacksquare"       ])  ; $\square$ ~.~ (var)
    ;; Symbols
    (""        [""                    ])  ; 
    ("inf"     ["\\infty"             ])  ; 
    ("ex"      ["\\exists"            ])  ; 
    ("exn"     ["\\nexists"           ])  ; $\exists$ + _n_ (neg)
    ("fa"      ["\\forall"            ])  ; 
    ("hb"      ["\\hbar"              ])  ; 
    ("hb."     ["\\hslash"            ])  ; $\hbar$ + _._  (var)
    ("dfd"     ["\\mathrm{d}"         ])  ; 
    ("dfd."    ["\\partial"           ])  ; $\mathrm{d}$  + _._ (var)
    ("dff"     ["\\frac{\\mathrm{d}}{\\mathrm{d}"])  ; 
    ("dff."    ["\\frac{\\partial}{\\partial"])  ; $\frac{\mathrm{d}}{\mathrm{d}\Box}$ + .(var)
    ("ii"      ["\\imath"             ])  ; 
    ("jj"      ["\\jmath"             ])  ; 
    ("nab"     ["\\nabla"             ])  ; 
    ("cm"      ["\\checkmark"         ])  ; 
    ;; Symbols spaces
    ("qu"      ["\\quad"              ])  ; 
    ("quu"     ["\\qquad"             ])  ; 
    ;; Symbols arrow1
    ("<-"      ["\\leftarrow"         ])  ; 
    ("->"      ["\\rightarrow"        ])  ; 
    ("-^"      ["\\uparrow"           ])  ; ~^~ looks like up arrow head
    ("-v"      ["\\downarrow"         ])  ; ~v~ looks like down arrow head
    ("<->"     ["\\leftrightarrow"    ])  ; 
    ("<-n"     ["\\nleftarrow"        ])  ; negate (~n~) of prev. section
    ("->n"     ["\\nrightarrow"       ])  ; arrows + _n_
    ("-^n"     ["\\nuparrow"          ])  ; 
    ("-vn"     ["\\ndownarrow"        ])  ; 
    ("<->"     ["\\nleftrightarrow"   ])  ; 
    ("-->"     ["\\longrightarrow"    ])  ; longer arrows, with 2 dashes
    ("<--"     ["\\longleftarrow"     ])  ; 
    ("|->"     ["\\mapsto"            ])  ; vertical-bar + ~->~  (this might rendered wrongly on Github)
    ;; Symbols arrow2
    ("<="      ["\\Leftarrow"         ])  ; compared to single arrrow
    ("=>"      ["\\Rightarrow"        ])  ; these uses ~=~ as the arrow shaft
    ("=^"      ["\\Uparrow"           ])  ; 
    ("=v"      ["\\Downarrow"         ])  ; 
    ("<=>"     ["\\Leftrightarrow"    ])  ; 
    ("iff"     ["\\Leftrightarrow"    ])  ; 
    ("<=n"     ["\\nLeftarrow"        ])  ; negate (~n~) of prev. section
    ("=>n"     ["\\nRightarrow"       ])  ; arrows + _n_
    ("<=>n"    ["\\nLeftrightarrow"   ])  ; 
    ("iffn"    ["\\nLeftrightarrow"   ])  ; 
    ("<==>"    ["\\Longleftrightarrow"])  ; longer arrows, with 2 dashes
    ("<=="     ["\\Longleftarrow"     ])  ; 
    ("==>"     ["\\Longrightarrow"    ])  ; 
    ;; Symbols arrow3
    ("<---"    ["\\xleftarrow[ ]{ }"  ])  ; these uses triple - or =
    ("--->"    ["\\xrightarrow[ ]{ }" ])  ; 
    ("===>"    ["\\xRightarrow[ ]{ }" ])  ; ~mathtools~ lib required
    ("<==="    ["\\xLeftarrow[ ]{ }"  ])  ; ~mathtools~ lib required
    ;; Symbols arrow3
    ("vec"     ["\\vec{"              ])  ; 
    ("bar"     ["\\bar{"              ])  ; 
    ("hat"     ["\\hat{"              ])  ; 
    ("dot"     ["\\dot{"              ])  ; 
    ("dot."    ["\\ddot{"             ])  ; (var)
    ("dot.."   ["\\dddot{"            ])  ; (var)
    ("dot..."  ["\\ddddot{"           ])  ; (var)
    ("dag"     ["^\\dagger"           ])  ; 
    ("dag."    ["^\\ddagger"          ])  ; (var)
    ("*.."     ["^*"                  ])  ; 
    ("deg"     ["^\\circ"             ])  ; 
    ("tr"      ["^T"                  ])  ; 
    ("trn"     ["^{-T}"               ])  ; (neg)
    ;; Operation: arith
    ("+-"      ["\\pm"                ])  ; 
    ("-+"      ["\\mp"                ])  ; 
    ("*x"      ["\\times"             ])  ; 
    ("::"      ["\\div"               ])  ; 
    ("**"      ["\\cdot"              ])  ; 
    ;; Operation: arith
    ("<."      ["\\leq"               ])  ; < = >
    (">."      ["\\geq"               ])  ; symbols
    ("<<"      ["\\ll"                ])  ; 
    (">>"      ["\\gg"                ])  ; 
    ("=n"      ["\\neq"               ])  ; negation
    ("<n"      ["\\nless"             ])  ; 
    (">n"      ["\\ngtr"              ])  ; 
    ("<.n"     ["\\nleq"              ])  ; 
    (">.n"     ["\\ngeq"              ])  ; 
    ("=?"      ["\\stackrel{?}{=}"    ])  ; with question mark
    ("<?"      ["\\stackrel{?}{<}"    ])  ; 
    (">?"      ["\\stackrel{?}{>}"    ])  ; 
    ("<.?"     ["\\stackrel{?}{\\leq}"])  ; 
    (">.?"     ["\\stackrel{?}{\\geq}"])  ; 
    ("<<?"     ["\\stackrel{?}{\\ll}" ])  ; 
    (">>?"     ["\\stackrel{?}{\\gg}" ])  ; 
    ("=y"      ["\\stackrel{\\checkmark}{=}"])  ; with check mark
    ("<y"      ["\\stackrel{\\checkmark}{<}"])  ; 
    (">y"      ["\\stackrel{\\checkmark}{>}"])  ; 
    ("<.y"     ["\\stackrel{\\checkmark}{\\leq}"])  ; 
    (">.y"     ["\\stackrel{\\checkmark}{\\geq}"])  ; 
    ("<<y"     ["\\stackrel{\\checkmark}{\\ll}"])  ; 
    (">>y"     ["\\stackrel{\\checkmark}{\\gg}"])  ; 
    ("=."      ["\\equiv"             ])  ; Variations of =
    ("sim"     ["\\sim"               ])  ; 
    ("simn"    ["\\nsim"              ])  ; 
    ("=.."     ["\\approx"            ])  ; 
    ("3="      ["\\equiv"             ])  ; 
    ("=:"      ["\\coloneqq"          ])  ; 
    (":="      ["\\coloneqq"          ])  ; 
    ;; Operation: arith
    ("in"      ["\\in"                ])  ; 
    ("in."     ["\\ni"                ])  ; 
    ("ni"      ["\\ni"                ])  ; 
    ("inn"     ["\\notin"             ])  ; (neg)
    ("0/"      ["\\emptyset"          ])  ; 
    ("nsr"     ["\\mathbb{R}"         ])  ; (n)umber (s)et (r)eal
    ("nsc"     ["\\mathbb{C}"         ])  ; (n)umber (s)et (c)omplex
    ("nsn"     ["\\mathbb{N}"         ])  ; ...
    ("nsp"     ["\\mathbb{P}"         ])  ; ...
    ("nsz"     ["\\mathbb{Z}"         ])  ; ...
    ("nsi"     ["\\mathbb{I}"         ])  ; ...
    ("sub"     ["\\subset"            ])  ; 
    ("subn"    ["\\nssubseteq"        ])  ; (neg)
    ("sub."    ["\\subseteq"          ])  ; (var)
    ("sub.n"   ["\\nsubseteq"         ])  ; (var, neg)
    ("subn."   ["\\nsubseteq"         ])  ; (neg, var)
    ("sup"     ["\\supset"            ])  ; 
    ("supn"    ["\\nsupseteq"         ])  ; (neg)
    ("sup."    ["\\supeseteq"         ])  ; (var)
    ("sup.n"   ["\\nsupseteq"         ])  ; (var, neg)
    ("supn."   ["\\nsupseteq"         ])  ; (neg, var)
    ;; Operation: arith
    ("or"      ["\\lor"               ])  ; 
    ("and"     ["\\lnd"               ])  ; 
    ("not"     ["\\neg"               ])  ; 
    ("or."     ["\\text{ or }"        ])  ; (var)
    ("and."    ["\\text{ and }"       ])  ; (var)
    ("not."    ["\\text{ not }"       ])  ; (var)
    ;; Func: main
    ("rank"    ["\\mathrm{rank}"      ])  ; 
    ("arg"     ["\\arg"               ])  ; 
    ("det"     ["\\det"               ])  ; 
    ("dim"     ["\\dim"               ])  ; 
    ("exp"     ["\\exp("              ])  ; 
    ("Im"      ["\\mathrm{Im}("       ])  ; 
    ("Re"      ["\\mathrm{Re}("       ])  ; 
    ("ln"      ["\\ln("               ])  ; 
    ("log"     ["\\log("              ])  ; 
    ("max"     ["\\max("              ])  ; 
    ("min"     ["\\min("              ])  ; 
    ("dim"     ["\\dim("              ])  ; 
    ("sqrt"    ["\\sqrt("             ])  ; 
    ("mod"     ["\\pmod("             ])  ; 
    ("mod."    ["\\mod"               ])  ; 
    ("mod.."   ["\\bmod"              ])  ; 
    ;; Func: Trig
    ("cos"    ["\\cos("         ])  ("cosh"   ["\\cosh("        ])
    ("sin"    ["\\sin("         ])  ("sinh"   ["\\sinh("        ])
    ("tan"    ["\\tan("         ])  ("tanh"   ["\\tanh("        ])
    ("cot"    ["\\cot("         ])  ("coth"   ["\\coth("        ])
    ("acos"   ["\\arccos("      ])  ("cos."   ["\\arccos("      ])
    ("asin"   ["\\arcsin("      ])  ("sin."   ["\\arcsin("      ])
    ("atan"   ["\\arctan("      ])  ("tan."   ["\\arctan("      ])
    ;; Func: iter
    ("il"      ["\\limits_{ }"        ])  ; (limits apparently doesn't render on Github page)
    ("il."     ["\\limits_{ }^{ }"    ])  ; . (var)
    ("lim"     ["\\lim"               ])  ; 
    ("sum"     ["\\sum"               ])  ; 
    ("prod"    ["\\prod"              ])  ; 
    ("int"     ["\\int"               ])  ; 
    ("inti"    ["\\iint"              ])  ; $\int$ + i
    ("intii"   ["\\iiint"             ])  ; $\int$ + ii
    ("intiii"  ["\\iiiint"            ])  ; $\int$ + iii
    ("into"    ["\\oint"              ])  ; $\int$ + o
    ("sum."    ["\\sum\\limits_{ i=1 }^{ n }"])  ; . (var)
    ("prod."   ["\\prod\\limits_{ i=1 }^{ n }"])  ; . (var)
    ("int."    ["\\int\\limits_{ }^{ }"])  ; . (var)
    ("int.."   ["\\int\\limits_{ 0 }^{ +\\infty }"])  ; . (var)
    ("int..."  ["\\int\\limits_{ -\\infty }^{ +\\infty }"])  ; . (var)
    ("inti."   ["\\iint\\limits_{ }"  ])  ; . (var)
    ("intii."  ["\\iiint\\limits_{ }" ])  ; . (var)
    ("intiii."  ["\\iiiint\\limits_{ }"])  ; . (var)
    ("into."   ["\\oint\\limits_{ }"  ])  ; . (var)
    ;; Structural: Parenthesis
    ("()."     ["\\left( \\right)"    ])  ; 
    ("().."    ["\\left( \\middle\\vert  \\right)"])  ; 
    ("[]."     ["\\left[ \\right]"    ])  ; 
    ("[].."    ["\\left[ \\middle\\vert  \\right]"])  ; (var)
    ("[].c"    ["\\lceil \\rceil"     ])  ; (var) (ceil)
    ("[].f"    ["\\lfloor \\rfloor"   ])  ; (var) (floor)
    ("{}."     ["\\left\\{ \\right\\}"])  ; 
    ("{}.."    ["\\left\\{ \\middle\\vert  \\right\\}"])  ; (var)
    ("<>."     ["\\left< \\right>"    ])  ; 
    ("<>.."    ["\\left< \\middle\\vert \\right>"])  ; (var)
    ("(."      ["\\left("             ])  ; half (
    (")."      ["\\right)"            ])  ; half )
    ("[."      ["\\left["             ])  ; half [
    ("]."      ["\\right]"            ])  ; half ]
    ("{."      ["\\left\\{"           ])  ; half {
    ("}."      ["\\right\\}"          ])  ; half }
    ("<."      ["\\left<"             ])  ; half <
    (">."      ["\\right>"            ])  ; half >
    ("(.."     ["\\left."             ])  ; half left .
    (").."     ["\\right."            ])  ; half right .
    ("|."      ["\\middle\\vert"      ])  ; Vertical bar related
    ("|.."     ["\\Bigg\\vert_{ }^{ }"])  ; Vertical bar related
    ("||."     ["\\left\\vert \\right\\vert"])  ; Vertical bar related
    ("||.."    ["\\left\\Vert \\right\\Vert"])  ; Vertical bar related
    ;; Structural: Text
    ("te"      ["\\text{"             ])  ; (te)xt
    ("tr"      ["\\mathrm{"           ])  ; (t)ext (r)oman
    ("tb"      ["\\mathbf{"           ])  ; (t)ext (b)old
    ("ti"      ["\\mathit{"           ])  ; (t)ext (i)talics
    ;; Structural: Text
    ("te"      ["\\text{"             ])  ; (te)xt
    ("tr"      ["\\mathrm{"           ])  ; (t)ext (r)oman
    ("tb"      ["\\mathbf{"           ])  ; (t)ext (b)old
    ("ti"      ["\\mathit{"           ])  ; (t)ext (i)talics
    ;; Structural: Sub-sup-scripts
    ("^"      ["^{"             ])  ("_"      ["_{"             ])
    ("pp"     ["^{"             ])  ("ll"     ["_{"             ])
    ("p0"     ["^0"             ])  ("l0"     ["_0"             ])
    ("p1"     ["^1"             ])  ("l1"     ["_1"             ])
    ("p2"     ["^2"             ])  ("l2"     ["_2"             ])
    ("p3"     ["^3"             ])  ("l3"     ["_3"             ])
    ("p4"     ["^4"             ])  ("l4"     ["_4"             ])
    ("pn"     ["^n"             ])  ("lnn"    ["_n"             ])
    ("px"     ["^x"             ])  ("li"     ["_i"             ])
    ("__"     ["\\underset{ }{ }"])  ("^^"     ["\\overset{ }{ }"])
    ("__."    ["\\underbrace{ }_{ }"])  ("^^."    ["\\overbrace{ }^{ }"])
    ("__.."   ["\\underline{ }" ])  ("^^.."   ["\\overline{ }"  ])
    ;; Structural: misc
    ("binom"   ["\\binom{"            ])  ; Binom
    ("box"     ["\\boxed{"            ])  ; Putting box around object
    ("ff"      ["\\frac{"             ])  ; Fractions
    ("can"     ["\\cancel{"           ])  ; 
    ("=="      ["&=\\\\n"             ])  ; helps in align env.
    ;; Structural: xy
    ("xy"      ["\\xymatrix{\\n\\n}"  ])  ; 
    ("bu"      ["\\bullet"            ])  ; 
    ("ar"      ["\\ar"                ])  ; 
)
