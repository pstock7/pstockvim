" Vim syntax file for the Midas macro scripting language.
" Language:	X-Midas Macro Language
" XM Version:	4.12.x+
" Author:	Fritz Reese <fritzoreese@gmail.com>
" Version: 1.0
" Date: March 2017
"
" Plase this in $VIMHOME/syntax (usually $HOME/.vim/syntax).
" To use the midas filetype, you can just 'set filetype=midas'.
" For automatic filetype detection, see the included 'midas_startup.vim'.
"

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Case insensitive
syn case ignore

syn match midasUnitHeader	"\<\(start\|end\)controls"
syn match midasUnitHeader	"\<endmacro"
syn match midasUnitHeader	"\<endsubroutine"
syn match midasUnitHeader	"\<procedure\>"
syn match midasType             "\<[scvqmt1-9xa][adflibopx]\>"
syn match midasDelim            ","

syn match midasLineContError "&"
syn match midasLineCont "&\s*$"
syn match midasOperator	"/"
syn match midasOperator	"\(+\|-\|\*\|\^\)"
syn match midasOperator	"="
syn match midasOperator	"\<\(eq\|lt\|le\|gt\|ge\|ne\)\>"

syn region midasIntrinsic start="^\s*\<[a-z][a-z_0-9]*" end=""
      \ transparent nextgroup=midasSwitches

syn match midasLabel "^\s*\<label" skipwhite nextgroup=midasIdentifier
syn match midasStart "^\s*\<startmacro" nextgroup=midasSwitches
syn match midasSubroutine "\<subroutine" skipwhite nextgroup=midasIdentifier
syn match midasSubroutine "\<procedure" skipwhite nextgroup=midasIdentifier

" If you like X to be highlighted as an identifier in a switch like id=X,
" remove midasIdentifier from the exception list for midasSwitches below:
syn region midasSwitches start="/" skip=+"[^"]*"+ end="\s\|$" matchgroup=midasSwitch transparent contained contains=ALLBUT,midasMacroCall,midasIntrinsic,midasIdentifier
syn match midasSwitch _/[^/ ="]\+_ contained

syn region midasTypedIdentifier start="\<[a-z]:" end="[\[ \t]\|$" transparent contains=midasIdentifierType,midasIdentifier,midasArgDefault
syn match midasIdentifier contained "\<[a-z][a-z_0-9]*"
syn match midasIdentifierType contained "\<[a-z]:"
syn match midasArgDefault contained "\[[^\]]\+\]"
syn match midasPipe "\<_[a-z_0-9]*"

syn keyword midasTodo		todo fixme

"Catch errors caused by too many right parentheses
syn region midasParen transparent start="(" end=")" contains=ALLBUT,midasParenError,midasSwithces,midasMacroCall,@midasCommentGroup,@spell
syn match  midasParenError   ")"

"Numbers of various sorts
" Integers
syn match midasNumber	display "\<\d\+\(_\a\w*\)\=[kgmt]\?\>"
" floating point number, without a decimal point
syn match midasFloat	display	"\<\d\+[deq][-+]\=\d\+[kgmt]\?\>"
" floating point number, starting with a decimal point
syn match midasFloat	display	"\.\d\+\([deq][-+]\=\d\+\)\=[kgmt]\?\>"
" floating point number, no digits after decimal
syn match midasFloat	display	"\<\d\+\.\([deq][-+]\=\d\+\)\=[kgmt]\?\>"
" floating point number, D or Q exponents
syn match midasFloat	display	"\<\d\+\.\d\+\([dq][-+]\=\d\+\)\=[kgmt]\?\>"
" floating point number
syn match midasFloat	display	"\<\d\+\.\d\+\(e[-+]\=\d\+\)\=[kgmt]\?\>"

syn region midasString	start=+"+ end=+"+ contains=midasColorFmt
syn match midasColorFmt "\~([^)]\+)" contained

syn cluster midasCommentGroup contains=midasTodo
syn match midasComment	"!.*$" contains=@midasCommentGroup,@spell

"Synchronising limits assume that comment and continuation lines are not mixed
syn sync linecont "&" minlines=30

"""" begin SYS builtins

syn keyword midasKeyword
      \ local call stop pause break continue jump exit return goto go

" 'elseif', not 'else if', so highlight error
syn match midasConditional
      \ "\<\(if\|else\|then\|endif\)\>"
syn match Error "else\s\+if"
syn match midasConditional "\<elseif\>"

syn keyword midasRepeat
      \ while forall endwhile endloop

syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(abs\%[cissa]\|acq\%[mod]\|add\|advis\%[ory]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(amfsy\%[nc]\|ask\|att\%[ach]\|audiocd\|auxf\%[unc]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(aux\%[iliary]\|auxp\%[ath]\|bee\%[p]\|biexpsvi\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(bitm\%[ask]\|blo\%[ckavg]\|boo\%[lean]\|bro\%[wse]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(calc\%[ulator]\|categ\%[ory]\|chec\%[kout]\|checkstat\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(cir\%[ccorl]\|clkcmd\|cnt\%[lthin]\|cnvt\%[_martes]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(comm\%[ent]\|compa\%[re]\|conc\%[atenate]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(conf\%[igure]\|conj\%[ugate]\|cons\%[tant]\|contour\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(control\|conve\%[rt]\|convo\%[lve]\|copyh\%[eader]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(cor\%[relate]\|csvconv\%[ert]\|dar\%[ray]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(datai\%[mport]\|data\%[list]\|date\%[s]\|dbl\%[og]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(deb\%[ug]\|deca\%[tenate]\|def\%[aults]\|demos\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(dem\%[ux]\|deta\%[ch]\|dete\%[ct]\|digtc\|div\%[ide]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(dow\%[nconvert]\|dpc\%[o]\|dpipe\|dr300_ttuner\|dsm\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(dsmclient\|dsmo\%[dule]\|dt202_ttuner\|dt300_ttuner\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(dt700_ttuner\|dua\%[l5000]\|dyn\%[zoom]\|editl\%[ist]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(emerg\%[ency]\|endm\%[ode]\|ends\%[uspend]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(enve\%[lope]\|env\%[ironment]\|erase\|erm\%[if]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(erro\%[r]\|expl\%[ain]\|expor\%[t]\|extr\%[act]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(f30\%[00]\|f6000\|faket\%[c]\|fani\%[n]\|fano\%[ut]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(fastc\%[orl]\|fasterf\%[ilter]\|fastf\%[ilter]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(fcalc\%[ulator]\|fcr\%[eate]\|fft\|fftsize\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(filel\%[ist]\|fil\%[es]\|filetr\%[ansp]\|filt3\%[000]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(filtd\%[ec]\|fin\%[d]\|firh\%[lbrt]\|firp\%[arks]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(firw\%[ind]\|fna\%[me]\|fsksi\%[m]\|fst\%[atistics]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(fsv\%[a]\|fsv\%[i]\|gat\%[e]\|genex\%[plain]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(genleap\%[seconds]\|gen\%[msginc]\|genpkt\%[sinc]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(getdisp\%[layinfo]\|get\%[value]\|gro\%[up]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(hardl\%[imit]\|hea\%[dermod]\|hel\%[p]\|hil\%[bert]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(histog\%[ram]\|his\%[tory]\|home\%[path]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(homo\%[genize]\|hps\%[tep]\|hshft\%[dec]\|hw\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(hwc\%[onfig]\|hwd\%[river]\|imfft\|imp\%[ort]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(inact\%[ive]\|info\|interl\%[eave]\|interp\%[olate]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(inv\%[fft]\|key\%[word]\|lim\%[it]\|lis\%[sajous]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(loadc\%[onstants]\|loc\%[ation]\|loga\%[rithm]\|loop\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(lrs\|lrs64\|mag\%[nitude]\|mapman\|mar\%[ray]\|mask\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(mas\%[ter]\|maxm\%[in]\|mdx\|media\%[nfilt]\|medit\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(men\%[u]\|merg\%[efile]\|mes\%[sage]\|mfft\|mfi\%[le]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(mli\%[st]\|modu\%[lo]\|morph\|morphf\%[ilt]\|mpo\%[ly]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(msg\%[mask]\|mtran\%[slate]\|mult2\%[000]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(mul\%[tiply]\|mux\|newr\%[ate]\|noop\|nor\%[malize]\|os\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(oscmd\|par\%[ray]\|par\%[se]\|pas\%[sfilt]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(peakp\%[ick]\|pha\%[se]\|pipe\|pola\%[r]\|poll\%[tc]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(polye\%[val]\|polyf\%[it]\|polyph\%[ase]\|prif\%[unc]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(pri\%[thin]\|pro\%[tect]\|pul\%[se]\|qso\%[rt]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(ram\%[p]\|rand\%[om]\|readid\|rec\%[all]\|ref\%[ormat]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(rel\%[ease]\|rem\%[ove]\|repack4\%[000]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(rescue6\%[000]\|reset\|res\%[ults]\|rmi\%[f]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(rqf\%[shift]\|rsm\|rth\%[istogram]\|rtl\%[iss]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(rtl\%[issd]\|sam\|samd\%[river]\|sar\%[ray]\|sav\%[e]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(say\|sbt\%[uner]\|sd350\|sedit\|setn\%[ode]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(sets\%[eed]\|sin\%[cosine]\|sinkf\%[ile]\|sinkmsg\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(sinksam\|sinksb\|sinksock\%[et]\|skip\|sla\%[ve]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(smo\%[oth]\|socketm\%[sg]\|sou\%[nder]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(sourcef\%[ile]\|sourcemsg\|sourcesam\|sourcesb\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(sourcesock\%[et]\|spe\%[ctra]\|speedo\%[meter]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(spl\%[ice]\|spl\%[it]\|statev\%[ector]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(stati\%[stics]\|st\%[atus]\|step\|stl3116\%[_set]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(subsh\%[ell]\|sub\%[tract]\|surfdemo\|svic\%[md]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(swi\%[tch]\|syncp\%[lot]\|sy\%[ntax]\|sys\%[con]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(t6filt\%[er]\|tc\%[cmd]\|thi\%[n]\|timec\%[ode]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(tim\%[er]\|tim\%[ex]\|trac\%[k]\|transfft\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(trans\%[form]\|transp\%[ose]\|trap\|tt\%[cmd]\|ttuner\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(tubi\%[quitous]\|tut\%[or]\|two\%[dthin]\|typeof\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(ubi\%[quitous]\|ung\%[roup]\|unif\%[orm]\|unit\%[s]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(univ\%[erse]\|unpr\%[otect]\|unw\%[rap]\|upd\%[ate]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(ups\%[ample]\|upz\%[ero]\|user\%[id]\|val\%[ue]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(ver\%[ify]\|vfile\%[s]\|vlist\|warn\%[ing]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(wav\%[eform]\|where\|whi\%[tenoise]\|widget\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(win\%[dow]\|wra\%[p]\|writeid\|xatm\%[plot]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xau\%[diocd]\|xbh\%[ost]\|xblib\|xca\%[ll]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xcfg\%[edit]\|xcntrl\|xco\%[lormap]\|xcon\%[trol]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xdata\%[list]\|xenv\%[ironment]\|xfpp\|xgeo\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xgeoe\%[vent]\|xgeop\%[lot]\|xhelp\|xmbackup\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xmb\%[ld]\|xmblib\|xmbopt\|xmbrpm\|xmc\%[heckproc]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xmd\%[ir]\|xmes\%[sage]\|xmk\%[ill]\|xml\%[istprocs]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xmo\%[pt]\|xmp\%[ath]\|xmp\%[roclist]\|xmr\%[emotes]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xmrestore\|xms\%[glog]\|xmshowenv\|xmval\%[ue]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xmv\%[er]\|xp3\%[d]\|xpanel\|xpc\|xpipe\|xpipemonitor\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xpl\%[ot]\|xr\%[aster]\|xrtd\%[isplay]\|xrtp\%[lot]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xrtr\%[aster]\|xrtsam\%[view]\|xrtsurf\%[ace]\|xscape\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(xse\%[arch]\|xtext\|xtu\%[tor]\|xvi\%[ew]\|xwi\%[ndow]\)\>"
syn match midasIntrinsic nextgroup=midasSwitches
      \ "^\s\+\<\(zpipe\)\>"

"""" end SYS builtins

" Define the default highlighting.
hi def link midasKeyword 	Keyword
hi def link midasConditional	Conditional
hi def link midasRepeat		Repeat
hi def link midasTodo		Todo
hi def link midasString		String
hi def link midasColorFmt	Comment
hi def link midasNumber		Number
hi def link midasOperator	Operator
hi def link midasLineCont	Operator
hi def link midasLineContError	Error
hi def link midasType		Type
hi def link midasSwitch		Delimiter
hi def link midasIntrinsic	Function
hi def link midasFloat		Float
hi def link midasPreCondit	PreCondit
hi def link midasParenError	Error
hi def link midasComment	Comment
hi def link midasIdentifierType	Type
hi def link midasIdentifier	Identifier
hi def link midasArgDefault	Constant
hi def link midasPipe		Constant

hi def link midasDelim		midasOperator
hi def link midasUnitHeader	midasPreCondit
hi def link midasStart		midasUnitHeader
hi def link midasSubroutine	midasUnitHeader
hi def link midasStartMacro	midasPreCondit
hi def link midasLabel 		midasKeyword

let b:current_syntax = "midas"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8 tw=132
