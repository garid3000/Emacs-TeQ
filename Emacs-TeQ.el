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

(defun quail-TeQ-endline (key idx)
  (quail-func-init)
  (end-of-line)
  (insert "\\begin{aligned}\n\n\\end{aligned}")
  (previous-line)
  (quail-func-end))
  )

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

(quail-define-rules
 ;; Greek Alphabets
 ("a."    ["\\alpha"     ])  ("A."    ["A"           ])
 ("b."    ["\\beta"      ])  ("B."    ["B"           ])
 ("c."    ["\\psi"       ])  ("C."    ["\\Psi"       ])
 ("d."    ["\\delta"     ])  ("D."    ["\\Delta"     ])
 ("e."    ["\\epsilon"   ])  ("E."    ["E"           ])
 ("f."    ["\\phi"       ])  ("F."    ["\\Phi"       ])
 ("g."    ["\\gamma"     ])  ("G."    ["\\Gamma"     ])
 ("h."    ["\\eta"       ])  ("H."    ["\\Eta"       ])
 ("i."    ["\\iota"      ])  ("I."    ["\\Iota"      ])
 ("j."    ["\\xi"        ])  ("J."    ["\\Xi"        ])
 ("k."    ["\\kappa"     ])  ("K."    ["K"           ])
 ("l."    ["\\lambda"    ])  ("L."    ["\\Lambda"    ])
 ("m."    ["\\mu"        ])  ("M."    ["M"           ])
 ("n."    ["\\nu"        ])  ("N."    ["N"           ])
 ("o."    ["\\omicron"   ])  ("O."    ["O"           ])
 ("p."    ["\\pi"        ])  ("P."    ["\\Pi"        ])
 ("r."    ["\\rho"       ])  ("R."    ["P"           ])
 ("s."    ["\\sigma"     ])  ("S."    ["\\Sigma"     ])
 ("t."    ["\\tau"       ])  ("T."    ["T"           ])
 ("th."   ["\\theta"     ])  ("Th."   ["\\Theta"     ])
 ("u."    ["\\upsilon"   ])  ("U."    ["\\Upsilon"   ])
 ("ve."   ["\\varepsilon"])  ("Ve."   ["\\Varepsilon"])
 ("vf."   ["\\varphi"    ])  ("Vf."   ["\\Varphi"    ])
 ("vs."   ["\\varsigma"  ])  ("Vs."   ["\\Varsigma"  ])
 ("vth."  ["\\vartheta"  ])  ("Vth."  ["\\Vartheta"  ])
 ("w."    ["\\omega"     ])  ("W."    ["\\Omega"     ])
 ("x."    ["\\chi"       ])  ("X."    ["X"           ])
 ("z."    ["\\zeta"      ])  ("Z."    ["Z"           ])

 ;; matrix/vecotr notation aka (bold)
 ("Am"  ["\\mathbf{A}"])     ("am"  ["\\mathbf{a}"])
 ("Bm"  ["\\mathbf{B}"])     ("bm"  ["\\mathbf{b}"])
 ("Cm"  ["\\mathbf{C}"])     ("cm"  ["\\mathbf{c}"])
 ("Dm"  ["\\mathbf{D}"])     ("dm"  ["\\mathbf{d}"])
 ("Em"  ["\\mathbf{E}"])     ("em"  ["\\mathbf{e}"])
 ("Fm"  ["\\mathbf{F}"])     ("fm"  ["\\mathbf{f}"])
 ("Gm"  ["\\mathbf{G}"])     ("gm"  ["\\mathbf{g}"])
 ("Hm"  ["\\mathbf{H}"])     ("hm"  ["\\mathbf{h}"])
 ("Im"  ["\\mathbf{I}"])     ("im"  ["\\mathbf{i}"])
 ("Jm"  ["\\mathbf{J}"])     ("jm"  ["\\mathbf{j}"])
 ("Km"  ["\\mathbf{K}"])     ("km"  ["\\mathbf{k}"])
 ("Lm"  ["\\mathbf{L}"])     ("lm"  ["\\mathbf{l}"])
 ("Mm"  ["\\mathbf{M}"])     ("mm"  ["\\mathbf{m}"])
 ("Nm"  ["\\mathbf{N}"])     ("nm"  ["\\mathbf{n}"])
 ("Om"  ["\\mathbf{O}"])     ("om"  ["\\mathbf{o}"])
 ("Pm"  ["\\mathbf{P}"])     ("pm"  ["\\mathbf{p}"])
 ("Qm"  ["\\mathbf{Q}"])     ("qm"  ["\\mathbf{q}"])
 ("Rm"  ["\\mathbf{R}"])     ("rm"  ["\\mathbf{r}"])
 ("Sm"  ["\\mathbf{S}"])     ("sm"  ["\\mathbf{s}"])
 ("Tm"  ["\\mathbf{T}"])     ("tm"  ["\\mathbf{t}"])
 ("Um"  ["\\mathbf{U}"])     ("um"  ["\\mathbf{u}"])
 ("Vm"  ["\\mathbf{V}"])     ("vm"  ["\\mathbf{v}"])
 ("Wm"  ["\\mathbf{W}"])     ("wm"  ["\\mathbf{w}"])
 ("Xm"  ["\\mathbf{X}"])     ("xm"  ["\\mathbf{x}"])
 ("Ym"  ["\\mathbf{Y}"])     ("ym"  ["\\mathbf{y}"])
 ("Zm"  ["\\mathbf{Z}"])     ("zm"  ["\\mathbf{z}"])

 ;; vector/hat notation 
 ("ah"  ["\\hat{a}"])        ("av"  ["\\vec{a}"])
 ("bh"  ["\\hat{b}"])        ("bv"  ["\\vec{b}"])
 ("ch"  ["\\hat{c}"])        ("cv"  ["\\vec{c}"])
 ("dh"  ["\\hat{d}"])        ("dv"  ["\\vec{d}"])
 ("eh"  ["\\hat{e}"])        ("ev"  ["\\vec{e}"])
 ("fh"  ["\\hat{f}"])        ("fv"  ["\\vec{f}"])
 ("gh"  ["\\hat{g}"])        ("gv"  ["\\vec{g}"])
 ("hh"  ["\\hat{h}"])        ("hv"  ["\\vec{h}"])
 ("ih"  ["\\hat{i}"])        ("iv"  ["\\vec{i}"])
 ("jh"  ["\\hat{j}"])        ("jv"  ["\\vec{j}"])
 ("kh"  ["\\hat{k}"])        ("kv"  ["\\vec{k}"])
 ("lh"  ["\\hat{l}"])        ("lv"  ["\\vec{l}"])
 ("mh"  ["\\hat{m}"])        ("mv"  ["\\vec{m}"])
 ("nh"  ["\\hat{n}"])        ("nv"  ["\\vec{n}"])
 ("oh"  ["\\hat{o}"])        ("ov"  ["\\vec{o}"])
 ("ph"  ["\\hat{p}"])        ("pv"  ["\\vec{p}"])
 ("qh"  ["\\hat{q}"])        ("qv"  ["\\vec{q}"])
 ("rh"  ["\\hat{r}"])        ("rv"  ["\\vec{r}"])
 ("sh"  ["\\hat{s}"])        ("sv"  ["\\vec{s}"])
 ("th"  ["\\hat{t}"])        ("tv"  ["\\vec{t}"])
 ("uh"  ["\\hat{u}"])        ("uv"  ["\\vec{u}"])
 ("vh"  ["\\hat{v}"])        ("vv"  ["\\vec{v}"])
 ("wh"  ["\\hat{w}"])        ("wv"  ["\\vec{w}"])
 ("xh"  ["\\hat{x}"])        ("xv"  ["\\vec{x}"])
 ("yh"  ["\\hat{y}"])        ("yv"  ["\\vec{y}"])
 ("zh"  ["\\hat{z}"])        ("zv"  ["\\vec{z}"])

 ("eq" quail-TeQ-equation)
 ("al" quail-TeQ-aligned)
 ("&=" ["&=\n\\\\"]) ("=&" ["&=\n\\\\"])
 ("/"  quail-TeQ-frac)
 ("el" quail-TeQ-endline)

 ("ve"  ["\\vec{ "])
 ("..." ["\\dots "])
 (".v"  ["\\vdots "])
 (".d"  ["\\ddots "])
 (".l"  ["\\ldots "])
 ("**"  ["\\cdot "])

 ;; main arithmetics
 ("+-"  ["\\pm "])
 ("-+"  ["\\mp "])
 ("*x"  ["\\times "])
 ("::"  ["\\div "])


 ;; arrows
 ("<-"          ["\\leftarrow "])
 ("->"          ["\\rightarrow "])
 ("<->"         ["\\leftrightarrow "])
 ("-^"          ["\\uparrow "])
 ("-v"          ["\\downarrow "])

 ("<-|"         ["\\mapsfrom "])
 ("|->"         ["\\mapsto "])

 ("<--"         ["\\longleftarrow "])
 ("-->"         ["\\longrightarrow "])
 ("<-->"        ["\\longleftrightarrow "])

 ("=^"          ["\\Uparrow "])
 ("=v"          ["\\Downarrow "])
 ("<=="         ["\\Leftarrow "])
 ("==>"         ["\\Rightarrow "])
 ("<=>"         ["\\Leftrightarrow "])
 ("iff"         ["\\iff"])
 ("<==>"        ["\\Leftrightarrow "])
 ("<===>"       ["\\Longleftrightarrow "])

 ("<==="        ["\\Longleftarrow "])
 ("===>"        ["\\Longrightarrow "])

 ("<---"        ["\\xleftarrow "])
 ("--->"        ["\\xrightarrow "])

 ("binom"       ["\\binom{ }{ } "])
 ("box"         ["\\box{ } "])

 ("case" ["\\begin{cases}\n\\end{cases}"])
 ("dag"  ["^\\dag"])
 ("deg"  ["^\\circ"])
 ("env"  ["\\begin{ }\n\\end{ }"])
 ("ff"   ["\\frac{ }{ }"])
 ("bar"  ["\\bar{}"])
 ("ddot" ["\\ddot{}"])
 ("dot" ["\\dot{}"])
 ("hat" ["\\hat{}"])



 ("il" ["\\limits_{ }^{ }"]) ;; probbably not used much
 ("im" ["\\( \\)"])
 ("imm" ["\\[ \\]"])

 ("lim"  ["\\lim\\limits_{ }"])
 ("int"  ["\\int\\limits_{ }^{ }"])
 ("intn" ["\\int"])
 ("inti" ["\\iint"]) ("intii"  ["\\iiint"])
 ("into" ["\\oint"]) ("intoi"  ["\\oiint"]) ("intio"  ["\\oiint"])
 ("prod" ["\\prod\\limits_{ }^{ }"])
 ("sum"  ["\\sum\\limits_{ }^{ }"])

 ("inf"  ["\\infty"])
 ("ex" ["\\exists"])
 ("exn" ["\\nexists"]) ("nex" ["\\nexists"])
 ("fa" ["\\forall"])
 ("hb" ["\\hbar"])
 ("par" ["\\partial"])
 ("sim" ["\\sim"])


 ("mat"  ["\\begin{matrix}\n\n\\end{matrix}"])
 ("matb" ["\\begin{bmatrix}\n\n\\end{bmatrix}"])
 ("matv" ["\\begin{vmatrix}\n\n\\end{vmatrix}"])
 ("matp" ["\\begin{pmatrix}\n\n\\end{pmatrix}"])


 ("nab" ["\\nabla"])
 ("can" ["\\cancel{}"])
 ("mod" ["\\mod"])
 ("sqrt" ["\\sqrt {}"])


 ;;trig
 ("cos"  ["\\cos"])      ("cosh" ["\\cosh"])
 ("sin"  ["\\sin"])      ("sinh" ["\\sinh"])
 ("tan"  ["\\tan"])      ("tanh" ["\\tanh"])
 ("cot"  ["\\cot"])      ("coth" ["\\coth"])
 ("acos" ["\\arccos"])   ("cosa" ["\\arccos"])
 ("asin" ["\\arcsin"])   ("sina" ["\\arcsin"])
 ("atan" ["\\arctan"])   ("tana" ["\\arctan"])


 ("rank" ["\\rank"])
 ("arg" ["\\arg"])
 ("det" ["\\det"])
 ("dim" ["\\dim"])
 ("exp" ["\\exp()"])
 ("Im" ["\\Im()"])
 ("Re" ["\\Re()"])
 ("ln" ["\\ln()"])
 ("log" ["\\log()"])
 ("max" ["\\max()"])
 ("min" ["\\min()"])

 ("()."  ["\\left( \\right)"])
 ("(|)." ["\\left( \\middle| \\right)"])
 ("()|." ["\\left( \\middle) \\right|"])
 ("[]."  ["\\left[ \\right]"])
 ("[|]." ["\\left[ \\middle| \\right]"])
 ("[]|." ["\\left[ \\middle] \\right|"])
 ("{}."  ["\\left\\{ \\right\\}"])
 ("{|}." ["\\left\\{ \\middle| \\right\\}"])
 ("{}|." ["\\left\\{ \\middle\\} \\right|"])
 ("||."  ["\\left| \\right|"])


 ("qu"          ["\\quad"])
 ("quu"         ["\\qquad"])
 ("quuu"        ["\\qqquad"])

 ;; reltations
 ("!="  ["\\neq "]) ("=!"       ["\\neq "]) ("=n" ["\\neq "])

 ("<="          ["\\leq "])
 (">="          ["\\geq "])
 ("<<"          ["\\ll "])
 (">>"          ["\\gg "])

 ("<=n"         ["\\nleq "])
 (">=n"         ["\\ngeq "])
 ("<<n"         ["\\nll "])
 (">>n"         ["\\ngg "])

 ("3="          ["\\equiv"])
 ("~~"          ["\\approx"])
 ;; ("?="               ["\\stackrel{\\checkmark}{=}"])
 ("=?"          ["\\stackrel{\\checkmark}{=}"])
 (":="          ["\\coloneqq"])
 (">?"          ["\\stackrel{\\checkmark}{>}"])
 (">=?"         ["\\stackrel{\\checkmark}{\\geq}"])
 ;; ("?>="              ["\\stackrel{\\checkmark}{\\geq}"])
 ("<?"          ["\\stackrel{\\checkmark}{<}"])
 ("<=?"         ["\\stackrel{\\checkmark}{\\leq}"])
 ;; ("?<="              ["\\stackrel{\\checkmark}{\\leq}"])

 ("<<?"         ["\\stackrel{\\checkmark}{\\ll}"])
 (">>?"         ["\\stackrel{\\checkmark}{\\gg}"])

 ;; geometry
 ("perp"        ["\\perp"])
 ("par"         ["\\parallel"])
 ("ang" ["\\angle"])
 ("angm" ["\\measuredangle"]) ("mang" ["\\measuredangle"])

 ;; logical and or
 ("and"         ["\\land"]) ("andt"     ["\\text{and}"])
 ("or"          ["\\lor"]) ("ort"       ["\\text{or}"])

 ;; sets
 ("in"          ["\\in"])
 ("inn"         ["\\nin"])

 ("0set"        ["\\emptyset"])
 ("nsR" ["\\mathbb{R}"])   ("nsr" ["\\mathbb{R}"])
 ("nsC" ["\\mathbb{C}"])   ("nsc" ["\\mathbb{C}"])
 ("nsN" ["\\mathbb{N}"])   ("nsn" ["\\mathbb{N}"])
 ("nsP" ["\\mathbb{P}"])   ("nsp" ["\\mathbb{P}"])
 ("nsZ" ["\\mathbb{Z}"])   ("nsz" ["\\mathbb{Z}"])
 ("nsI" ["\\mathbb{I}"])   ("nsi" ["\\mathbb{I}"])


 ("sub"         ["\\subset"])
 ("subn"        ["\\nsubset"])
 ("sub="        ["\\subeseteq"])
 ("sub=n"       ["\\nsubeseteq"]) ("subn="      ["\\nsubeseteq"])
 ("sup"         ["\\supset"])
 ("supn"        ["\\nsupset"])
 ("sup="        ["\\supeseteq"])
 ("sup=n"       ["\\nsupeseteq"]) ("supn="      ["\\nsupeseteq"])


 ;; texts
 ("te"          ["\\text{}"])
 ("tr"          ["\\mathrm{}"])
 ("tb"          ["\\mathbf{}"])
 ("ti"          ["\\mathif{}"])
 ("dd"          ["\\mathrm{d}"])

 ;;xy
 ("xy"          ["\\xymatrix{\n\n}"])
 ("bu"          ["\\bullet "])
 ("ar"          ["\\ar "])

 ;; convient
 ("sr"   ["^2"]) ("cb"   ["^3"]) ("inv"  ["^{-1}"])
 ("po"   ["^{"]) ("lo"   ["_{"])
 ("px"   ["^x"]) ("li"   ["_i"])
 ("p0"   ["^0"]) ("l0"   ["_0"])
 ("p1"   ["^1"]) ("l1"   ["_1"])
 ("p2"   ["^2"]) ("l2"   ["_2"])
 ("p3"   ["^3"]) ("l3"   ["_3"])
 ("p4"   ["^4"]) ("l4"   ["_4"])
 ("pn"   ["^n"]) ("lnn"  ["_n"])
 ("__"   ["\\underset{ }{ }"] )  ("___"  ["\\underbrace{ }_{ }"] )
 ("^^"   ["\\overset{ }{ }"] )   ("^^^"  ["\\overbrace{ }^{ }" ] )
 )
