(require 'quail)

(quail-define-package
 "Test-Latex" "Test-Latex"  "tltx-" t
 "Test-Latex Keyboard Layout"
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

 ("eq"  ["\\begin{equation}\n\n\\end{equation}"])
 ("eq*" ["\\begin{equation*}\n\n\\end{equation*}"])
 ("eqa" ["\\begin{equation}\n\\begin{aligned}\n\\end{aligned}\n\\end{equation}"])
 ("al"  ["\\begin{align}\n\\end{align}"])
 ("ve"  ["\\vector{ }"])
 ("..." ["\\dots "])
 (".v"  ["\\vdots "])
 (".d"  ["\\ddots "])
 (".l"  ["\\ldots "])
 ("*."  ["\\cdot "])

 ;; main arithmetics
 ("+-"  ["\\pm "])
 ("-+"  ["\\mp "])
 ("*x"  ["\\times "])
 (": "  ["\\div "])

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
 ("imm" ["\\[\n\n\\]"])

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
 ("//"          ["\\parallel"])
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
 ("sr"   ["^2"])
 ("cb"   ["^3"])
 ("inv"  ["^{-1}"])
 ("po"   ["^{"]) ("lo"   ["_{"])
 ("px"   ["^x"]) ("li"   ["_i"])
 ("p1"   ["^1"]) ("l1"   ["_1"])
 ("p2"   ["^2"]) ("l2"   ["_2"])
 ("p3"   ["^3"]) ("l3"   ["_3"])
 ("p4"   ["^4"]) ("l4"   ["_4"])
 ("pn"   ["^n"]) ("lnn"  ["_n"])
 ("__"   ["\\underset{ }{ }"] )  ("___"  ["\\underbrace{ }_{ }"] )
 ("^^"   ["\\overset{ }{ }"] )   ("^^^"  ["\\overbrace{ }^{ }"] )
 ;; ("sr"  (delete-backward-char 1))


 ;;command matrices A-Z
 ("Am"  ["\\mathbf{A}"])
 ("Bm"  ["\\mathbf{B}"])
 ("Cm"  ["\\mathbf{C}"])
 ("Dm"  ["\\mathbf{D}"])
 ("Pm"  ["\\mathbf{P}"])
 ("Im"  ["\\mathbf{I}"])
 ("Hm"  ["\\mathbf{H}"])
 ("Xm"  ["\\mathbf{X}"])
 ("Ym"  ["\\mathbf{Y}"])
 ("Zm"  ["\\mathbf{Z}"])

 ("xm"  ["\\mathbf{x}"])
 ("ym"  ["\\mathbf{y}"])
 ("zm"  ["\\mathbf{z}"])
 ("vm"  ["\\mathbf{v}"])



 ("av"  ["\\vector{a}"])
 ("bv"  ["\\vector{b}"])
 ("cv"  ["\\vector{c}"])
 ("dv"  ["\\vector{d}"])
 ("rv"  ["\\vector{r}"])
 ("Rv"  ["\\vector{R}"])
 ("xv"  ["\\vector{x}"])
 ("yv"  ["\\vector{y}"])
 ("zv"  ["\\vector{z}"])
 ("vv"  ["\\vector{v}"])
 ("uv"  ["\\vector{u}"])

 ("ih" ["\\hat{\\imath}"])
 ("jh" ["\\hat{\\jmath}"])
 ("kh" ["\\hat{k}"])
 ("xh" ["\\hat{x}"])
 ("yh" ["\\hat{y}"])
 ("zh" ["\\hat{z}"])
 ("rh" ["\\hat{r}"])
 )



