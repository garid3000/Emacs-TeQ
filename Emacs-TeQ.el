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
    ("av"     ["\\vec{a}"       ])  ("ah"     ["\\hat{a}"       ])
    ("bv"     ["\\vec{b}"       ])  ("bh"     ["\\hat{b}"       ])
    ("cv"     ["\\vec{c}"       ])  ("ch"     ["\\hat{c}"       ])
    ("dv"     ["\\vec{d}"       ])  ("dh"     ["\\hat{d}"       ])
    ("ev"     ["\\vec{e}"       ])  ("eh"     ["\\hat{e}"       ])
    ("fv"     ["\\vec{f}"       ])  ("fh"     ["\\hat{f}"       ])
    ("gv"     ["\\vec{g}"       ])  ("gh"     ["\\hat{g}"       ])
    ("hv"     ["\\vec{h}"       ])  ("hh"     ["\\hat{h}"       ])
    ("iv"     ["\\vec{i}"       ])  ("ih"     ["\\hat{i}"       ])
    ("jv"     ["\\vec{j}"       ])  ("jh"     ["\\hat{j}"       ])
    ("kv"     ["\\vec{k}"       ])  ("kh"     ["\\hat{k}"       ])
    ("lv"     ["\\vec{l}"       ])  ("lh"     ["\\hat{l}"       ])
    ("mv"     ["\\vec{m}"       ])  ("mh"     ["\\hat{m}"       ])
    ("nv"     ["\\vec{n}"       ])  ("nh"     ["\\hat{n}"       ])
    ("ov"     ["\\vec{o}"       ])  ("oh"     ["\\hat{o}"       ])
    ("pv"     ["\\vec{p}"       ])  ("ph"     ["\\hat{p}"       ])
    ("qv"     ["\\vec{q}"       ])  ("qh"     ["\\hat{q}"       ])
    ("rv"     ["\\vec{r}"       ])  ("rh"     ["\\hat{r}"       ])
    ("sv"     ["\\vec{s}"       ])  ("sh"     ["\\hat{s}"       ])
    ("tv"     ["\\vec{t}"       ])  ("th"     ["\\hat{t}"       ])
    ("uv"     ["\\vec{u}"       ])  ("uh"     ["\\hat{u}"       ])
    ("vv"     ["\\vec{v}"       ])  ("vh"     ["\\hat{v}"       ])
    ("wv"     ["\\vec{w}"       ])  ("wh"     ["\\hat{w}"       ])
    ("xv"     ["\\vec{x}"       ])  ("xh"     ["\\hat{x}"       ])
    ("yv"     ["\\vec{y}"       ])  ("yh"     ["\\hat{y}"       ])
    ("zv"     ["\\vec{z}"       ])  ("zh"     ["\\hat{z}"       ])
    ;; Expanding Func
    ("/"       quail-TeQ-frac        )  ; fraction on previous
    ("eq"      quail-TeQ-equation    )  ; equation environment
    ("al"      quail-TeQ-aligned     )  ; aligned environment
    ("el"      quail-TeQ-endofline   )  ; end of line
    ;; Symbols-dots
    ("..."     ["\\dots"              ])  ; 3 dots
    (".v"      ["\\vdots"             ])  ; vertical dots
    (".d"      ["\\ddots"             ])  ; diagonale dots
    (".l"      ["\\ldots"             ])  ; low dots
    ;; Symbols-geo
    ("perp"    ["\\perp"              ])  ; 
    ("perpn"   ["\\perp"              ])  ; 
    ("para"    ["\\parallel"          ])  ; 
    ("paran"   ["\\nparallel"         ])  ; 
    ("ang"     ["\\angle"             ])  ; 
    ("ang."    ["\\measuredangle"     ])  ; 
    ;; Symbols
    ("inf"     ["\\infty"             ])  ; 
    ("ex"      ["\\exists"            ])  ; 
    ("ex."     ["\\nexists"           ])  ; 
    ("fa"      ["\\forall"            ])  ; 
    ("hb"      ["\\hbar"              ])  ; 
    ("hb."     ["\\hslash"            ])  ; 
    ("dd"      ["\\mathrm{d}"         ])  ; 
    ("dd."     ["\\partial"           ])  ; 
    ("ii"      ["\\imath"             ])  ; 
    ("jj"      ["\\jmath"             ])  ; 
    ("nab"     ["\\nabla"             ])  ; 
    ("cm"      ["\\checkmark"         ])  ; 
    ;; Symbols spaces
    ("qu"      ["\\quad"              ])  ; 
    ("quu"     ["\\qquad"             ])  ; 
    ;; Symbols arrow1
    ("<-"      ["\\leftarrow"         ])  ; left arrow
    ("->"      ["\\rightarrow"        ])  ; right arrow
    ("-^"      ["\\uparrow"           ])  ; up arrow
    ("-v"      ["\\downarrow"         ])  ; down arrow
    ("<->"     ["\\leftrightarrow"    ])  ; left-right arrow
    ("<-n"     ["\\nleftarrow"        ])  ; not left arrow
    ("->n"     ["\\nrightarrow"       ])  ; not right arrow
    ("-^n"     ["\\nuparrow"          ])  ; not up arrow
    ("-vn"     ["\\ndownarrow"        ])  ; not down arrow
    ("<->"     ["\\nleftrightarrow"   ])  ; not left-right arrow
    ("-->"     ["\\longrightarrow"    ])  ; 
    ("<--"     ["\\longleftarrow"     ])  ; 
    ("\\vert ->"  ["\\mapsto"            ])  ; 
    ;; Symbols arrow2
    ("<="      ["\\Leftarrow"         ])  ; left arrow
    ("=>"      ["\\Rightarrow"        ])  ; right arrow
    ("=^"      ["\\Uparrow"           ])  ; up arrow
    ("=v"      ["\\Downarrow"         ])  ; down arrow
    ("<=>"     ["\\Leftrightarrow"    ])  ; left-right arrow
    ("iff"     ["\\Leftrightarrow"    ])  ; left-right arrow
    ("<=n"     ["\\nLeftarrow"        ])  ; left arrow
    ("=>n"     ["\\nRightarrow"       ])  ; right arrow
    ("<=>n"    ["\\nLeftrightarrow"   ])  ; left-right arrow
    ("iffn"    ["\\nLeftrightarrow"   ])  ; left-right arrow
    ("<==>"    ["\\Longleftrightarrow"])  ; left-right arrow
    ("<=="     ["\\Longleftarrow"     ])  ; left-right arrow
    ("==>"     ["\\Longrightarrow"    ])  ; left-right arrow
    ;; Symbols arrow3
    ("<---"    ["\\xleftarrow[ ]{ }"  ])  ; 
    ("--->"    ["\\xrightarrow[ ]{ }" ])  ; 
    ("===>"    ["\\xRightarrow[ ]{ }" ])  ; ~mathtools~ lib required
    ("<==="    ["\\xLeftarrow[ ]{ }"  ])  ; ~mathtools~ lib required
    ;; Symbols arrow3
    ("vec"     ["\\vec"               ])  ; 
    ("bar"     ["\\bar"               ])  ; 
    ("hat"     ["\\hat"               ])  ; 
    ("dot"     ["\\dot"               ])  ; 
    ("dot."    ["\\ddot"              ])  ; 
    ("dot.."   ["\\dddot"             ])  ; 
    ("dot..."  ["\\ddddot"            ])  ; 
    ("dag"     ["^\\dagger"           ])  ; 
    ("dag."    ["^\\ddagger"          ])  ; 
    ("*.."     ["^*"                  ])  ; 
    ("deg"     ["^\\circ"             ])  ; 
    ("tr"      ["^T"                  ])  ; 
    ("tr."     ["^{-T}"               ])  ; 
    ;; Operation: arith
    ("+-"      ["\\pm"                ])  ; 
    ("-+"      ["\\mp"                ])  ; 
    ("*x"      ["\\times"             ])  ; 
    ("::"      ["\\div"               ])  ; 
    ("**"      ["\\cdot"              ])  ; 
    ;; Operation: arith
    ("=n"      ["\\neq"               ])  ; 
    ("=."      ["\\equiv"             ])  ; 
    ("=?"      ["\\stackrel{?}{=}"    ])  ; 
    ("=y"      ["\\stackrel{\\checkmark}{=}"])  ; 
    ("3="      ["\\equiv"             ])  ; 
    ("=:"      ["\\coloneqq"          ])  ; 
    (":="      ["\\coloneqq"          ])  ; 
    ("=.="     ["\\sim"               ])  ; 
    ("=n="     ["\\nsim"              ])  ; 
    (""        ["\\approx"            ])  ; 
    ("<n"      ["\\nless"             ])  ; 
    ("<."      ["\\leq"               ])  ; 
    ("<.n"     ["\\nleq"              ])  ; 
    ("<?"      ["\\stackrel{?}{<}"    ])  ; 
    ("<y"      ["\\stackrel{\\checkmark}{<}"])  ; 
    ("<.?"     ["\\stackrel{?}{\\leq}"])  ; 
    ("<.y"     ["\\stackrel{\\checkmark}{\\leq}"])  ; 
    ("<<"      ["\\ll"                ])  ; 
    ("<<?"     ["\\stackrel{?}{\\ll}" ])  ; 
    ("<<y"     ["\\stackrel{\\checkmark}{\\ll}"])  ; 
    (">n"      ["\\ngtr"              ])  ; 
    (">."      ["\\geq"               ])  ; 
    (">.n"     ["\\ngeq"              ])  ; 
    (">?"      ["\\stackrel{?}{>}"    ])  ; 
    (">y"      ["\\stackrel{\\checkmark}{>}"])  ; 
    (">.?"     ["\\stackrel{?}{\\geq}"])  ; 
    (">.y"     ["\\stackrel{\\checkmark}{\\geq}"])  ; 
    (">>"      ["\\gg"                ])  ; 
    (">>?"     ["\\stackrel{?}{\\gg}" ])  ; 
    (">>y"     ["\\stackrel{\\checkmark}{\\gg}"])  ; 
    ;; Operation: arith
    ("in"      ["\\in"                ])  ; 
    ("in."     ["\\ni"                ])  ; 
    ("ni"      ["\\ni"                ])  ; 
    ("inn"     ["\\notin"             ])  ; 
    ("0/"      ["\\emptyset"          ])  ; 
    ("nsr"     ["\\mathbb{R}"         ])  ; 
    ("nsc"     ["\\mathbb{C}"         ])  ; 
    ("nsn"     ["\\mathbb{N}"         ])  ; 
    ("nsp"     ["\\mathbb{P}"         ])  ; 
    ("nsz"     ["\\mathbb{Z}"         ])  ; 
    ("nsi"     ["\\mathbb{I}"         ])  ; 
    ("sub"     ["\\subset"            ])  ; 
    ("subn"    ["\\nssubseteq"        ])  ; 
    ("sub="    ["\\subseteq"          ])  ; 
    ("sub=n"   ["\\nsubseteq"         ])  ; 
    ("subn="   ["\\nsubseteq"         ])  ; 
    ("sup"     ["\\supset"            ])  ; 
    ("supn"    ["\\nsupseteq"         ])  ; 
    ("sup="    ["\\supeseteq"         ])  ; 
    ("sup=n"   ["\\nsupseteq"         ])  ; 
    ("supn="   ["\\nsupseteq"         ])  ; 
    ;; Operation: arith
    ("or"      ["\\lor"               ])  ; 
    ("and"     ["\\lnd"               ])  ; 
    ("not"     ["\\neg"               ])  ; 
    ("or."     ["\\text{ or }"        ])  ; 
    ("and."    ["\\text{ and }"       ])  ; 
    ("not."    ["\\text{ not }"       ])  ; 
    ;; Func: main
    ("rank"    ["\\mathrm{rank}"      ])  ; 
    ("arg"     ["\\arg"               ])  ; 
    ("det"     ["\\det"               ])  ; 
    ("dim"     ["\\dim"               ])  ; 
    ("exp"     ["\\exp"               ])  ; 
    ("Im"      ["\\mathrm{Im}"        ])  ; 
    ("Re"      ["\\mathrm{Re}"        ])  ; 
    ("ln"      ["\\ln"                ])  ; 
    ("log"     ["\\log"               ])  ; 
    ("max"     ["\\max"               ])  ; 
    ("min"     ["\\min"               ])  ; 
    ("dim"     ["\\dim"               ])  ; 
    ("sqrt"    ["\\sqrt"              ])  ; 
    ("mod"     ["\\pmod"              ])  ; 
    ("mod."    ["\\mod"               ])  ; 
    ("mod.."   ["\\bmod"              ])  ; 
    ;; Func: Trig
    ("cos"    ["\\cos"          ])  ("cosh"   ["\\cosh"         ])
    ("sin"    ["\\sin"          ])  ("sinh"   ["\\sinh"         ])
    ("tan"    ["\\tan"          ])  ("tanh"   ["\\tanh"         ])
    ("cot"    ["\\cot"          ])  ("coth"   ["\\coth"         ])
    ("acos"   ["\\arccos"       ])  ("cos."   ["\\arccos"       ])
    ("asin"   ["\\arcsin"       ])  ("sin."   ["\\arcsin"       ])
    ("atan"   ["\\arctan"       ])  ("tan."   ["\\arctan"       ])
    ;; Func: iter
    ("il"      ["\\limits_{ }^{ }"    ])  ; 
    ("lim"     ["\\lim"               ])  ; 
    ("sum"     ["\\sum"               ])  ; 
    ("prod"    ["\\prod"              ])  ; 
    ("int"     ["\\int"               ])  ; 
    ("inti"    ["\\iint"              ])  ; 
    ("intii"   ["\\iiint"             ])  ; 
    ("intiii"  ["\\iiiint"            ])  ; 
    ("into"    ["\\oint"              ])  ; 
    ("sum."    ["\\sum\\limits_{ i=1 }^{ n }"])  ; 
    ("prod."   ["\\prod\\limits_{ i=1 }^{ n }"])  ; 
    ("int."    ["\\int\\limits_{ -\\infty }^{ -\\infty }"])  ; 
    ("inti."   ["\\iint\\limits_{ C }"])  ; 
    ("intii."  ["\\iiint\\limits_{ C }"])  ; 
    ("intiii."  ["\\iiiint\\limits_{ C }"])  ; 
    ("into."   ["\\oint\\limits_{ C }"])  ; 
    ;; Structural: Parenthesis
    ("()."     ["\\left( \\right)"    ])  ; 
    ("().."    ["\\left( \\middle\\vert  \\right)"])  ; 
    ("[]."     ["\\left[ \\right]"    ])  ; 
    ("[].."    ["\\left[ \\middle\\vert  \\right]"])  ; 
    ("[].c"    ["\\lceil \\rceil"     ])  ; 
    ("[].f"    ["\\lfloor \\rfloor"   ])  ; 
    ("{}."     ["\\left\\{ \\right\\}"])  ; 
    ("{}.."    ["\\left\\{ \\middle\\vert  \\right\\}"])  ; 
    ("\\vert\\vert ."  ["\\left\\vert \\right\\vert"])  ; 
    ;; Structural: Text
    ("te"      ["\\text{}"            ])  ; 
    ("tr"      ["\\mathrm{}"          ])  ; 
    ("tb"      ["\\mathbf{}"          ])  ; 
    ("ti"      ["\\mathit{}"          ])  ; 
    ;; Structural: Text
    ("te"      ["\\text{}"            ])  ; 
    ("tr"      ["\\mathrm{}"          ])  ; 
    ("tb"      ["\\mathbf{}"          ])  ; 
    ("ti"      ["\\mathit{}"          ])  ; 
    ;; Structural: Sub-sup-scripts
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
    ("binom"   ["\\binom"             ])  ; 
    ("box"     ["\\boxed"             ])  ; 
    ("can"     ["\\cancel"            ])  ; requires ~cancel~
    ("&="      ["&=\\n\\\\\\\\"       ])  ; 
    ("=&"      ["&=\\n\\\\\\\\"       ])  ; 
    ;; Structural: xy
    ("xy"      ["\\xymatrix{\\n\\n}"  ])  ; 
    ("bu"      ["\\bullet"            ])  ; 
    ("ar"      ["\\ar"                ])  ; 
)
