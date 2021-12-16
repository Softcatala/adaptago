#!/bin/sed -f

# "tradueix" la capçalera
#1,/^msgid / s/([^[:alnum:]])catalan/${1}Catalan (Valencian)/g
#1,/^msgid / s/([^[:alnum:]])Catalan/${1}Catalan (Valencian)/g
#1,/^msgid / s/([^[:alnum:]])català/${1}valencià/g
#1,/^msgid / s/([^[:alnum:]])Català/${1}Valencià/g

s/([^[:alnum:]])Language: ca/${1}Language: ca-valencia/g
s/([^[:alnum:]])X-Pootle-Path: \/ca/${1}X-Pootle-Path: \/ca-valencia/g

# Treure per a eMule. No tradueixis linies que no pertanyin a un msgstr
/^msgstr/,/^#/ {
# /[^[:alnum:]]\"/ { //Afegir per a eMule

# Treure per a eMule. No tradueixis linies comentades
/^#/ b END

# formes verbals complicades.  s'inclouen explícitament les declinacions
# que ens interessen.
s/([^[:alnum:]])(p|P)ugui([^[:alnum:]]|$)/${1}${2}uga${3}/g
s/([^[:alnum:]])(p|P)uguin([^[:alnum:]]|$)/${1}${2}uguen${3}/g
s/([^[:alnum:]])(a|A|desa|Desa)ctivi(n\?[^[:alnum:]]|$)/${1}${2}ctive${3}/g
s/([^[:alnum:]])(a|A)grupi(n|s|)([^[:alnum:]]|$)/${1}${2}grupe${3}${4}/g
s/([^[:alnum:]])(c|C)liqui(n\?[^[:alnum:]]|$)/${1}${2}lique${3}/g
s/([^[:alnum:]])(a|A)propi(n\?[^[:alnum:]]|$)/${1}${2}prope${3}/g
s/([^[:alnum:]])(a|A)justi(n\?[^[:alnum:]]|$)/${1}${2}juste${3}/g
s/([^[:alnum:]])(c|C)onfirmi(n\?[^[:alnum:]]|$)/${1}${2}onfirme${3}/g
s/([^[:alnum:]])(c|C)onfirmo(n\?[^[:alnum:]]|$)/${1}${2}onfirme${3}/g
s/([^[:alnum:]])(v|V)isiti(n\?[^[:alnum:]]|$)/${1}${2}isite${3}/g
s/([^[:alnum:]])(b|B)uidi(n\?[^[:alnum:]]|$)/${1}${2}uide${3}/g
s/([^[:alnum:]])(p|P)regunti(n|s|)([^[:alnum:]]|$)/${1}${2}regunte${3}${4}/g
s/([^[:alnum:]])(e|E)xecuti(n|s|)([^[:alnum:]]|$)/${1}${2}xecute${3}${4}/g
s/([^[:alnum:]])(s|S)olucioni(n|s|)([^[:alnum:]]|$)/${1}${2}olucione${3}${4}/g
s/([^[:alnum:]])(r|R)ecordi(n|s|)([^[:alnum:]]|$)/${1}${2}ecorde${3}${4}/g
s/([^[:alnum:]])(tr|Tr|canv|Canv|ampl|Ampl|env|Env|reenv|Reenv|inic|Inic|reinic|Reinic)iï(n|s|)([^[:alnum:]]|$)/${1}${2}ie${3}${4}/g
s/([^[:alnum:]])(m|M)ostri(n|s|)([^[:alnum:]]|$)/${1}${2}ostre${3}${4}/g
s/([^[:alnum:]])(A)turi(n|s|)([^[:alnum:]]|$)/${1}Pare${3}${4}/g
s/([^[:alnum:]])(a)turi(n|s|)([^[:alnum:]]|$)/${1}pare${3}${4}/g
s/([^[:alnum:]])(p|P)ari(n|s|)([^[:alnum:]]|$)/${1}${2}are${3}${4}/g
s/([^[:alnum:]])(b|B)aixi(n|s|)([^[:alnum:]]|$)/${1}${2}aixe${3}${4}/g
s/([^[:alnum:]])(i|I|rei|Rei)ntenti(n|s|)([^[:alnum:]]|$)/${1}${2}ntente${3}${4}/g
s/([^[:alnum:]])(Desc|desc|c|C)onnecti(n|s|)([^[:alnum:]]|$)/${1}${2}onnecte${3}${4}/g
s/([^[:alnum:]])(P|p)rovi(n|s|)([^[:alnum:]]|$)/${1}${2}rove${3}${4}/g
s/([^[:alnum:]])(M|m|T|t)anqui(n|s|)([^[:alnum:]]|$)/${1}${2}anque${3}${4}/g
s/([^[:alnum:]])(A|a)cabi(n|s|)([^[:alnum:]]|$)/${1}${2}cabe${3}${4}/g
s/([^[:alnum:]])(A|a)rribi(n|s|)([^[:alnum:]]|$)/${1}${2}rribe${3}${4}/g
s/([^[:alnum:]])(U|u)tilitzi(n|s|)([^[:alnum:]]|$)/${1}${2}tilitze${3}${4}/g
s/([^[:alnum:]])(Q|q)uedi(n|s|)([^[:alnum:]]|$)/${1}${2}uede${3}${4}/g
s/([^[:alnum:]])(A|a)dreci(n|s|)([^[:alnum:]]|$)/${1}${2}drece${3}${4}/g
s/([^[:alnum:]])(M|m)arqui(n|s|)([^[:alnum:]]|$)/${1}${2}arque${3}${4}/g
s/([^[:alnum:]])(P|p)osi(n|s|)([^[:alnum:]]|$)/${1}${2}ose${3}${4}/g
s/([^[:alnum:]])(E|e)mmagatzemi(n|s|)([^[:alnum:]]|$)/${1}${2}mmagatzeme${3}${4}/g
s/([^[:alnum:]])(G|g)estioni(n|s|)([^[:alnum:]]|$)/${1}${2}estione${3}${4}/g
s/([^[:alnum:]])(A|a)nalitzi(n|s|)([^[:alnum:]]|$)/${1}${2}nalitze${3}${4}/g
s/([^[:alnum:]])(F|f)inalitzi(n|s|)([^[:alnum:]]|$)/${1}${2}inalitze${3}${4}/g
s/([^[:alnum:]])(I|i)nstal·li(n|s|)([^[:alnum:]]|$)/${1}${2}nstal·le${3}${4}/g
s/([^[:alnum:]])(I|i)nstaŀli(n|s|)([^[:alnum:]]|$)/${1}${2}nstaŀle${3}${4}/g
s/([^[:alnum:]])(P|p)arpellegi(n|s|)([^[:alnum:]]|$)/${1}${2}arpellege${3}${4}/g
s/([^[:alnum:]])(C|c)reï(n|s|)([^[:alnum:]]|$)/${1}${2}ree${3}${4}/g
s/([^[:alnum:]])(I|i)mplementi(n|s|)([^[:alnum:]]|$)/${1}${2}mplemente${3}${4}/g
s/([^[:alnum:]])(P|p)engi(n|s|)([^[:alnum:]]|$)/${1}${2}enge${3}${4}/g
s/([^[:alnum:]])(F|f)uncioni(n|s|)([^[:alnum:]]|$)/${1}${2}uncione${3}${4}/g
s/([^[:alnum:]])(E|e)specifiqui(n|s|)([^[:alnum:]]|$)/${1}${2}specifique${3}${4}/g
s/([^[:alnum:]])(H|h)ereti(n|s|)([^[:alnum:]]|$)/${1}${2}erete${3}${4}/g
s/([^[:alnum:]])(V|v)isualitzi(n|s|)([^[:alnum:]]|$)/${1}${2}isualitze${3}${4}/g
s/([^[:alnum:]])(P|p)ubliqui(n|s|)([^[:alnum:]]|$)/${1}${2}ublique${3}${4}/g
s/([^[:alnum:]])(C|c)odifiqui(n|s|)([^[:alnum:]]|$)/${1}${2}odifique${3}${4}/g

s/([^[:alnum:]])enllaci([^[:alnum:]]|$)/${1}enllace${2}/g
s/([^[:alnum:]])Enllaci([^[:alnum:]]|$)/${1}Enllace${2}/g
s/([^[:alnum:]])surti([^[:alnum:]]|$)/${1}isca${2}/g
s/([^[:alnum:]])Surti([^[:alnum:]]|$)/${1}Isca${2}/g
s/([^[:alnum:]])surtin([^[:alnum:]]|$)/${1}isquen${2}/g
s/([^[:alnum:]])Surtin([^[:alnum:]]|$)/${1}Isquen${2}/g
s/([^[:alnum:]])(a|A)paregui([^[:alnum:]]|$)/${1}${2}parega${3}/g
s/([^[:alnum:]])(a|A)paregui(n|s)([^[:alnum:]]|$)/${1}${2}paregue${3}${4}/g
s/([^[:alnum:]])(e|E)scrigui([^[:alnum:]]|$)/${1}${2}scriga${3}/g
s/([^[:alnum:]])(e|E)scrigui(n|s)([^[:alnum:]]|$)/${1}${2}scrigue${3}${4}/g
s/([^[:alnum:]])(p|P)rengui([^[:alnum:]]|$)/${1}${2}renga${3}/g
s/([^[:alnum:]])(p|P)rengui(n|s)([^[:alnum:]]|$)/${1}${2}rengue${3}${4}/g
s/([^[:alnum:]])(c|C)algui([^[:alnum:]]|$)/${1}${2}alga${3}/g
s/([^[:alnum:]])(c|C)algui(n|s)([^[:alnum:]]|$)/${1}${2}algue${3}${4}/g
s/([^[:alnum:]])(s|S)igui([^[:alnum:]]|$)/${1}${2}iga${3}/g
s/([^[:alnum:]])(s|S)iguin([^[:alnum:]]|$)/${1}${2}iguen${3}/g
s/([^[:alnum:]])(e|E)stigui([^[:alnum:]]|$)/${1}${2}stiga${3}/g
s/([^[:alnum:]])(e|E)stiguin([^[:alnum:]]|$)/${1}${2}stiguen${3}/g
s/([^[:alnum:]])(p|P)ermeti([^[:alnum:]]|$)/${1}${2}ermeta${3}/g
s/([^[:alnum:]])(p|P)ermeti(n|s)([^[:alnum:]]|$)/${1}${2}ermete${3}${4}/g
s/([^[:alnum:]])(obt|Obt|cont|Cont|t|T)ingui([^[:alnum:]]|$)/${1}${2}inga${3}/g
s/([^[:alnum:]])(obt|Obt|cont|Cont|t|T)ingui(n|s)([^[:alnum:]]|$)/${1}${2}ingue${3}${4}/g
s/([^[:alnum:]])(v|V)ulgui([^[:alnum:]]|$)/${1}${2}ulga${3}/g
s/([^[:alnum:]])(v|V)ulgui(n|s)([^[:alnum:]]|$)/${1}${2}ulgue${3}${4}/g
s/([^[:alnum:]])(v|V)egi([^[:alnum:]]|$)/${1}${2}eja${3}/g
s/([^[:alnum:]])(v|V)egi(n|s)([^[:alnum:]]|$)/${1}${2}ege${3}${4}/g
s/([^[:alnum:]])(i|I)nclogui([^[:alnum:]]|$)/${1}${2}ncloga${3}/g
s/([^[:alnum:]])(i|I)nclogui(n|s)([^[:alnum:]]|$)/${1}${2}nclogue${3}${4}/g
s/([^[:alnum:]])(h|H)agi([^[:alnum:]]|$)/${1}${2}aja${3}/g
s/([^[:alnum:]])(h|H)àgiu([^[:alnum:]]|$)/${1}${2}àgeu${3}/g
s/([^[:alnum:]])(h|H)agi(n|s)([^[:alnum:]]|$)/${1}${2}age${3}${4}/g
s/([^[:alnum:]])(v|V)enci([^[:alnum:]]|$)/${1}${2}ença${3}/g
s/([^[:alnum:]])(v|V)enci(n|s)([^[:alnum:]]|$)/${1}${2}ence${3}${4}/g
s/([^[:alnum:]])(r|R)ebi([^[:alnum:]]|$)/${1}${2}eba${3}/g
s/([^[:alnum:]])(r|R)ebi(n|s)([^[:alnum:]]|$)/${1}${2}eben${3}${4}/g
s/([^[:alnum:]])(f|F)aci([^[:alnum:]]|$)/${1}${2}aça${3}/g
s/([^[:alnum:]])(f|F)aci(n|s)([^[:alnum:]]|$)/${1}${2}ace${3}${4}/g
s/([^[:alnum:]])(d|D)igui([^[:alnum:]]|$)/${1}${2}iga${3}/g
s/([^[:alnum:]])(d|D)igui(n|s)([^[:alnum:]]|$)/${1}${2}igue${3}${4}/g
s/([^[:alnum:]])(p|P)remi([^[:alnum:]]|$)/${1}${2}rema${3}/g
s/([^[:alnum:]])(p|P)remi(n|s)([^[:alnum:]]|$)/${1}${2}reme${3}${4}/g




s/([^[:alnum:]])Ompli(n|s)([^[:alnum:]]|$)/${1}Òmpligue${2}${3}/g
s/([^[:alnum:]])Ompli([^[:alnum:]]|$)/${1}Òmpliga${2}/g
s/([^[:alnum:]])ompli(n|s)([^[:alnum:]]|$)/${1}òmpligue${2}${3}/g
s/([^[:alnum:]])ompli([^[:alnum:]]|$)/${1}òmpliga${2}/g
s/([^[:alnum:]])Obri(n|s)([^[:alnum:]]|$)/${1}Òbrigue${2}${3}/g
s/([^[:alnum:]])Obri([^[:alnum:]]|$)/${1}Òbriga${2}/g
s/([^[:alnum:]])obri(n|s)([^[:alnum:]]|$)/${1}òbrigue${2}${3}/g
s/([^[:alnum:]])obri([^[:alnum:]]|$)/${1}òbriga${2}/g


s/([^[:alnum:]])(ret|Ret|t|T)orni(n|s|)([^[:alnum:]]|$)/${1}${2}orne${3}${4}/g
s/([^[:alnum:]]|^)(p|P)assi(n|s|)([^[:alnum:]]|$)/${1}${2}asse${3}${4}/g
s/([^[:alnum:]]|^)(c|C)omenci(n|s|)([^[:alnum:]]|$)/${1}${2}omence${3}${4}/g
s/([^[:alnum:]]|^)(t|T)robi(n|s|)([^[:alnum:]]|$)/${1}${2}robe${3}${4}/g
s/([^[:alnum:]]|^)(d|D)emani(n|s|)([^[:alnum:]]|$)/${1}${2}emane${3}${4}/g
s/([^[:alnum:]]|^)(p|P)regunti(n|s|)([^[:alnum:]]|$)/${1}${2}regunte${3}${4}/g

## sufix -eix
# formes diferents d'-ix
s/([^[:alnum:]])([lL])legeix(en|es|)([^[:alnum:]]|$)/${1}${2}lig${3}${4}/g
s/([^[:alnum:]])([aA]_\?)fegeix(en|es|)([^[:alnum:]]|$)/${1}${2}fig${3}${4}/g
s/([^[:alnum:]])([lL])legeixi([^[:alnum:]]|$)/${1}${2}lija${3}/g
s/([^[:alnum:]])([lL])legeixi(n|s)([^[:alnum:]]|$)/${1}${2}lige${3}${4}/g
s/([^[:alnum:]])([aA]_\?)fegeixi([^[:alnum:]]|$)/${1}${2}fija${3}/g
s/([^[:alnum:]])([aA]_\?)fegeixi(n|s)([^[:alnum:]]|$)/${1}${2}fige${3}${4}/g

#Crisca -> Cresca
s/([^[:alnum:]])([cC])risca([^[:alnum:]]|$)/${1}${2}resca${3}/g

#Ho sento -> Ho sentim
#L'accepció de Ho sentim és més impersonal que la primera persona, l'altra opció en valencià és Ho sent.
s/([^[:alnum:]])([hH])o sento([^[:alnum:]]|$)/${1}${2}o sentim${3}/g

#General d'uï i iï
s/([[:alnum:]])quï([^[:alnum:]]|$)/${1}qüe${2}/g
s/([[:alnum:]])quïs([^[:alnum:]]|$)/${1}qües${2}/g
s/([[:alnum:]])quïn([^[:alnum:]]|$)/${1}qüen${2}/g
s/([[:alnum:]])uï([^[:alnum:]]|$)/${1}ue${2}/g
s/([[:alnum:]])uïs([^[:alnum:]]|$)/${1}ues${2}/g
s/([[:alnum:]])uïn([^[:alnum:]]|$)/${1}uen${2}/g
s/([[:alnum:]])iï([^[:alnum:]]|$)/${1}ie${2}/g
s/([[:alnum:]])iïs([^[:alnum:]]|$)/${1}ies${2}/g
s/([[:alnum:]])iïn([^[:alnum:]]|$)/${1}ien${2}/
#Typos üü i ïï
s/([[:alnum:]])üü([[:alnum:]]|$)/${1}ü${2}/
s/([[:alnum:]])ïï([[:alnum:]]|$)/${1}ï${2}/

## sufix -eixi
# regla genèrica again
s/([[:alnum:]])ueixi([^[:alnum:]]|$)/${1}uïsca${2}/g
s/([[:alnum:]])ueixis([^[:alnum:]]|$)/${1}uïsques${2}/g
s/([[:alnum:]])ueixin([^[:alnum:]]|$)/${1}uïsquen${2}/g
s/([[:alnum:]])eixi([^[:alnum:]]|$)/${1}isca${2}/g
s/([[:alnum:]])eixis([^[:alnum:]]|$)/${1}isques${2}/g
s/([[:alnum:]])eixin([^[:alnum:]]|$)/${1}isquen${2}/g
# pífies again
s/([^[:alnum:]]|^)disca([^[:alnum:]]|$)/${1}deixi${2}/g
s/([^[:alnum:]]|^)disques([^[:alnum:]]|$)/${1}deixis${2}/g
s/([^[:alnum:]]|^)disquen([^[:alnum:]]|$)/${1}deixin${2}/g

# s/sortir/eixir/g i derivats
s/([^[:alnum:]])sortints([^[:alnum:]]|$)/${1}ixents${2}/g
s/([^[:alnum:]])quan sortiu([^[:alnum:]]|$)/${1}quan isqueu${2}/g		# hi ha cap manera millor de capturar el subjuntiu?
s/([^_&[:alnum:]]|^)surt([^[:alnum:]]|$)/${1}ix${2}/g
s/([^_&[:alnum:]]|^)la sortida([[:alnum:]])/${1}l'eixida${2}/g
s/([^_&[:alnum:]]|^)sorti([[:alnum:]])/${1}eixi${2}/g
s/([^_&[:alnum:]]|^)Surt([^[:alnum:]]|$|\")/${1}Ix${2}/g
s/([^_&[:alnum:]]|^)Sorti([[:alnum:]])/${1}Eixi${2}/g
s/([^[:alnum:]])\_Surt([^[:alnum:]]|$)/${1}I_x${2}/g
s/([^_&[:alnum:]]|^)_sorti([[:alnum:]])/${1}ei_xi${2}/g
s/([^_&[:alnum:]]|^)s_orti([[:alnum:]])/${1}ei_xi${2}/g

s/([^[:alnum:]])(O|o)bre([^[:alnum:]]|$)/${1}${2}bri${3}/g
s/([^[:alnum:]])(O|o)brís([^[:alnum:]]|$)/${1}${2}brira${3}/g
s/([^[:alnum:]]|^)(O|o)bríssiu([^[:alnum:]]|$)/${1}${2}brireu${3}/g
s/([^[:alnum:]]|^)(O|o)brissin([^[:alnum:]]|$)/${1}${2}briren${3}/g

#s/([^_&[:alnum:]]|^)mid(a|es)([^[:alnum:]]|$)/${1}grandàri${2}${3}/g
#s/([^_&[:alnum:]]|^)Mid(a|es)([^[:alnum:]]|$)/${1}Grandàri${2}${3}/g

s/([^[:alnum:]]|^)(A|a)quí([^[:alnum:]]|$)/${1}${2}cí${3}/g
s/([^[:alnum:]]|^)(s|S|m|M)eva([^[:alnum:]]|$)/${1}${2}eua${3}/g
s/([^[:alnum:]]|^)(s|S|m|M)eves([^[:alnum:]]|$)/${1}${2}eues${3}/g
s/([^_&[:alnum:]]|^)escull([^[:alnum:]]|$)/${1}trieu${2}/g
s/([^_&[:alnum:]]|^)Escull([^[:alnum:]]|$)/${1}Trieu${2}/g
s/([^_&[:alnum:]]|^)enrere([^[:alnum:]]|$)/${1}arrere${2}/g
s/([^_&[:alnum:]]|^)Enrere([^[:alnum:]]|$)/${1}Arrere${2}/g
s/([^_&[:alnum:]]|^)endarrere([^[:alnum:]]|$)/${1}arrere${2}/g
s/([^_&[:alnum:]]|^)Endarrere([^[:alnum:]]|$)/${1}Arrere${2}/g
s/([^_&[:alnum:]]|^)endavant([^[:alnum:]]|$)/${1}avant${2}/g
s/([^_&[:alnum:]]|^)Endavant([^[:alnum:]]|$)/${1}Avant${2}/g
s/([^[:alnum:]]|^)([Ff])eina([^[:alnum:]]|$)/${1}${2}aena${3}/g
s/([^_&[:alnum:]]|^)aviat([^[:alnum:]]|$)/${1}prompte${2}/g
s/([^_&[:alnum:]]|^)Aviat([^[:alnum:]]|$)/${1}Prompte${2}/g
s/([^_&[:alnum:]]|^)Avui([^[:alnum:]]|$)/${1}Hui${2}/g
s/([^_&[:alnum:]]|^)avui([^[:alnum:]]|$)/${1}hui${2}/g
s/([^[:alnum:]]|^)([Dd])e franc([^[:alnum:]]|$)/${1}${2}ebades${3}/g
s/([^_&[:alnum:]]|^)si us plau([^[:alnum:]]|$)/${1}per favor${2}/g
s/([^_&[:alnum:]]|^)Si us plau([^[:alnum:]]|$)/${1}Per favor${2}/g
s/([^_&[:alnum:]]|^)de cop([^[:alnum:]]|$)/${1}de colp${2}/g
s/([^[:alnum:]]|^)([Oo])fert([^[:alnum:]]|$)/${1}${2}ferit${3}/g
s/([^[:alnum:]]|^)([Oo])mplert([^[:alnum:]]|$)/${1}${2}mplit${3}/g
s/([^[:alnum:]]|^)([Ee])stablert([^[:alnum:]]|$)/${1}${2}stablit${3}/g
s/([^[:alnum:]]|^)([Ee])stablerta([^[:alnum:]]|$)/${1}${2}stablida${3}/g

s/([^[:alnum:]]|^)vermells([^[:alnum:]]|$)/${1}rojos${2}/g
s/([^[:alnum:]]|^)vermell([^[:alnum:]]|$)/${1}roig${2}/g
s/([^[:alnum:]]|^)Vermell([^[:alnum:]]|$)/${1}Roig${2}/g
s/([^[:alnum:]]|^)Ve_rmell([^[:alnum:]]|$)/${1}_Roig${2}/g
s/([^[:alnum:]]|^)(A|a)ccepto([^[:alnum:]]|$)/${1}${2}ccepte${3}/g
s/([^[:alnum:]]|^)(P|p)rometo([^[:alnum:]]|$)/${1}${2}romet${3}/g
s/([^[:alnum:]]|^)(T|t)orno([^[:alnum:]]|$)/${1}${2}orne${3}/g

#us -> vos
s/([^[:alnum:]]|^)us([^[:alnum:]]|$)/${1}vos${2}/g
s/([^[:alnum:]]|^)Us([^[:alnum:]]|$)/${1}Vos${2}/g
s/([^_[:alnum:]]|^)en-vos([^[:alnum:]]|$)/${1}en-us${2}/g
#s/([^[:alnum:]]|^)(D|d)ispositi&vos([^[:alnum:]]|$)/${1}${2}ispositi\&us${3}/g
s/([[:alnum:]])&vos([^[:alnum:]]|$)/${1}\&us${2}/g

#emplenar -> omplir
s/([^[:alnum:]]|^)Emplenar([^[:alnum:]]|$)/${1}Omplir${2}/g
s/([^[:alnum:]]|^)emplenar([^[:alnum:]]|$)/${1}omplir${2}/g
s/([^[:alnum:]]|^)Emplena([^[:alnum:]]|$)/${1}Ompli${2}/g
s/([^[:alnum:]]|^)emplena([^[:alnum:]]|$)/${1}ompli${2}/g
s/([^[:alnum:]]|^)Emplenin([^[:alnum:]]|$)/${1}Omplen${2}/g
s/([^[:alnum:]]|^)emplenin([^[:alnum:]]|$)/${1}omplen${2}/g
s/([^[:alnum:]]|^)empleni([^[:alnum:]]|$)/${1}ompla${2}/g
s/([^[:alnum:]]|^)Empleneu([^[:alnum:]]|$)/${1}Ompliu${2}/g
s/([^[:alnum:]]|^)empleneu([^[:alnum:]]|$)/${1}ompliu${2}/g

#mancar -> faltar
s/([^[:alnum:]]|^)Mancar([^[:alnum:]]|$)/${1}Faltar${2}/g
s/([^[:alnum:]]|^)mancar([^[:alnum:]]|$)/${1}faltar${2}/g
s/([^[:alnum:]]|^)Manca([^[:alnum:]]|$)/${1}Falta${2}/g
s/([^[:alnum:]]|^)manca([^[:alnum:]]|$)/${1}falta${2}/g
s/([^[:alnum:]]|^)Manquin([^[:alnum:]]|$)/${1}Falten${2}/g
s/([^[:alnum:]]|^)manquin([^[:alnum:]]|$)/${1}falten${2}/g
s/([^[:alnum:]]|^)Manqui([^[:alnum:]]|$)/${1}Falte${2}/g
s/([^[:alnum:]]|^)manqui([^[:alnum:]]|$)/${1}falte${2}/g
s/([^[:alnum:]]|^)Manqueu([^[:alnum:]]|$)/${1}Falteu${2}/g
s/([^[:alnum:]]|^)manqueu([^[:alnum:]]|$)/${1}falteu${2}/g

#quelcom -> alguna cosa
s/([^[:alnum:]]|^)quelcom([^[:alnum:]]|$)/${1}alguna cosa${2}/g
s/([^[:alnum:]]|^)Quelcom([^[:alnum:]]|$)/${1}Alguna cosa${2}/g

#alçada/amplada -> alçària/amplària (excepte amplada de banda)
s/([^[:alnum:]]|^)Alçada([^[:alnum:]]|$)/${1}Alçària${2}/g
s/([^[:alnum:]]|^)A_lçada([^[:alnum:]]|$)/${1}A_lçària${2}/g
s/([^[:alnum:]]|^)alçada([^[:alnum:]]|$)/${1}alçària${2}/g
s/([^[:alnum:]]|^)Amplada([^[:alnum:]]|$)/${1}Amplària${2}/g
s/([^[:alnum:]]|^)amplada([^[:alnum:]]|$)/${1}amplària${2}/g
s/([^[:alnum:]]|^)ampla_da([^[:alnum:]]|$)/${1}amplà_ria${2}/g
s/([^[:alnum:]]|^)Am_plada([^[:alnum:]]|$)/${1}Am_plària${2}/g
s/([^[:alnum:]]|^)Ampla_da([^[:alnum:]]|$)/${1}Amplà_ria${2}/g
s/([^[:alnum:]]|^)Amplària de banda([^[:alnum:]]|$)/${1}Amplada de banda${2}/g
s/([^[:alnum:]]|^)amplària de banda([^[:alnum:]]|$)/${1}amplada de banda${2}/g


s/([^[:alnum:]]|^)(Cont|cont|T|t|V|v|Obt|obt|Ret|ret|Mant|mant)enir-ne([^[:alnum:]]|$)/${1}${2}indre'n${3}/g
s/([^[:alnum:]]|^)(Cont|cont|T|t|V|v|Obt|obt|Ret|ret|Mant|mant)enir([^[:alnum:]]|$)/${1}${2}indre${3}/g
s/([^[:alnum:]]|^)(C|c)aler([^[:alnum:]]|$)/${1}${2}aldre${3}/g
s/([^[:alnum:]]|^)(V|v)aler([^[:alnum:]]|$)/${1}${2}aldre${3}/g
s/([^[:alnum:]]|^)(C|c)aber([^[:alnum:]]|$)/${1}${2}abre${3}/g


#Correccions d'accents tancats - oberts

#Fotudes amb a i e, balear distingeix però central no
s/([[:alnum:]]|^)àssi(m|u)([^[:alnum:]]|$)/${1}àre${2}${3}/g
s/([[:alnum:]]|^)assin([^[:alnum:]]|$)/${1}aren${2}/g
#s/([[:alnum:]]|^)éssi(m|u)([^[:alnum:]]|$)/${1}ére${2}${3}/g
#s/([[:alnum:]]|^)essin([^[:alnum:]]|$)/${1}eren${2}/g
s/([[:alnum:]]|^)íssi(m|u)([^[:alnum:]]|$)/${1}íreu${2}${3}/g
s/([[:alnum:]]|^)issin([^[:alnum:]]|$)/${1}iren${2}/g

#Prova gués
s/([[:alnum:]]|^)gués([^[:alnum:]]|$)/${1}guera${2}/g
s/([[:alnum:]]|^)guéssi(m|u)([^[:alnum:]]|$)/${1}guére${2}${3}/g
s/([[:alnum:]]|^)guessin([^[:alnum:]]|$)/${1}gueren${2}/g

s/([^[:alnum:]]|^)(r|R)eprèn([^[:alnum:]]|$)/${1}${2}eprén${3}/g
s/([^[:alnum:]]|^)(i|I)nterès([^[:alnum:]]|$)/${1}${2}nterés${3}/g

#Accents tipus anglès o emès
s/([[:alnum:]]|^)(m|n|d|l|gu|c|b|r|o|t)ès([^[:alnum:]]|$)/${1}${2}és${3}/g

#Correcions on hi ha & o _

s/([^[:alnum:]]|^)S&urt([^[:alnum:]]|$)/${1}I\&x${2}/g
s/([^[:alnum:]]|^)s&urt([^[:alnum:]]|$)/${1}i\&x${2}/g
s/([^[:alnum:]]|^)&Desa([^[:alnum:]]|$)/${1}Guar\&da${2}/g
s/([^[:alnum:]]|^)&desa([^[:alnum:]]|$)/${1}guar\&da${2}/g
s/([^[:alnum:]]|^)_Desa([^[:alnum:]]|$)/${1}Guar_da${2}/g
s/([^[:alnum:]]|^)D_esa([^[:alnum:]]|$)/${1}Guar_da${2}/g
s/([^[:alnum:]]|^)_desa([^[:alnum:]]|$)/${1}guar_da${2}/g
s/([^[:alnum:]]|^)De_sa([^[:alnum:]]|$)/${1}Guar_da${2}/g
s/([^[:alnum:]]|^)de_sa([^[:alnum:]]|$)/${1}guar_da${2}/g
s/([^[:alnum:]]|^)de_sar([^[:alnum:]]|$)/${1}guar_dar${2}/g
s/([^[:alnum:]]|^)De&sa([^[:alnum:]]|$)/${1}Guar\&da${2}/g
s/([^[:alnum:]]|^)de&sa([^[:alnum:]]|$)/${1}guar\&da${2}/g
s/([^[:alnum:]]|^)Des&a([^[:alnum:]]|$)/${1}Guar\&da${2}/g
s/([^[:alnum:]]|^)des&a([^[:alnum:]]|$)/${1}guar\&da${2}/g
#s/([^[:alnum:]]|^)Mi&da([^[:alnum:]]|$)/${1}Gran\&dària${2}/g
#s/([^[:alnum:]]|^)mi&da([^[:alnum:]]|$)/${1}gran\&dària${2}/g
s/([^[:alnum:]]|^)Afegei&x([^[:alnum:]]|$)/${1}Afi\&g${2}/g
s/([^[:alnum:]]|^)A&fegeix([^[:alnum:]]|$)/${1}A\&fig${2}/g
s/([^[:alnum:]]|^)Obr&e([^[:alnum:]]|$)/${1}Obr\&i${2}/g
s/([^[:alnum:]]|^)&Reprèn([^[:alnum:]]|$)/${1}\&Reprén${2}/g
s/([^[:alnum:]]|^)&Enrere([^[:alnum:]]|$)/${1}A\&rrere${2}/g
s/([^[:alnum:]]|^)_Enrere([^[:alnum:]]|$)/${1}A_rrere${2}/g
s/([^[:alnum:]]|^)_enrere([^[:alnum:]]|$)/${1}a_rrere${2}/g
s/([^[:alnum:]]|^)En&rere([^[:alnum:]]|$)/${1}A\&rrere${2}/g
s/([^[:alnum:]]|^)En&davant([^[:alnum:]]|$)/${1}Avan\&t${2}/g
s/([^[:alnum:]]|^)En_davant([^[:alnum:]]|$)/${1}Avan_t${2}/g
s/([^[:alnum:]]|^)Enda&vant([^[:alnum:]]|$)/${1}Avan\&t${2}/g
s/([^[:alnum:]]|^)Endavan&t([^[:alnum:]]|$)/${1}Avan\&t${2}/g
s/([^[:alnum:]]|^)Dese&u([^[:alnum:]]|$)/${1}Guarde\&u${2}/g
s/([^[:alnum:]]|^)c&ontinguin([^[:alnum:]]|$)/${1}c\&ontinguen${2}/g
s/([^[:alnum:]]|^)&marquis([^[:alnum:]]|$)/${1}\&marques${2}/g
s/([^[:alnum:]]|^)A&fegix([^[:alnum:]]|$)/${1}A\&fig${2}/g


# errada->error NO es toca per que porta problemes amb el canvi de gènere
# a banda què:
# 17:25 < nyu> jordim: errada->error ?
# 17:26 < jordim> jo eixa no la canviaria

#Vocabulari específic
##A sobre -> damunt
s/([^_&[:alnum:]]|^)A sobre([^[:alnum:]]|$)/${1}Damunt${2}/g
s/([^_&[:alnum:]]|^)a sobre([^[:alnum:]]|$)/${1}damunt${2}/g
s/([^_&[:alnum:]]|^)a ~sobre([^[:alnum:]]|$)/${1}da~munt${2}/g
##Préssec -> bresquilla
s/([^_&[:alnum:]]|^)Préssec([^[:alnum:]]|$)/${1}Bresquilla${2}/g
s/([^_&[:alnum:]]|^)préssec([^[:alnum:]]|$)/${1}bresquilla${2}/g


# desar -> guardar
	# Podria anar separat del pronom, però aleshores ens faria malbé
	# l'apostrofament.  Si trobem altres construccions amb "desarà" pense que
	# és millor fer-les per inclussió (rmh)
s/([^_&[:alnum:]]|^)es desar(à|an)([^[:alnum:]]|$)/${1}es guardar${2}${3}/g
s/([^_&[:alnum:]]|^)Es desar(à|an)([^[:alnum:]]|$)/${1}Es guardar${2}${3}/g
s/([^_&[:alnum:]]|^)es desi(n|s|)([^[:alnum:]]|$)/${1}es guarde${2}${3}/g
s/([^_&[:alnum:]]|^)desi(n|s|)([^[:alnum:]]|$)/${1}guarde${2}${3}/g
s/([^_&[:alnum:]]|^)desa(t|da|ts|des)([^[:alnum:]]|$)/${1}guarda${2}${3}/g
s/([^_&[:alnum:]]|^)des(a|en|ar|eu|at|ada|ats|ades)([^[:alnum:]]|$)/${1}guard${2}${3}/g
s/([^_&[:alnum:]]|^)Des(a|en|ar|eu|at|ada|ats|ades)([^[:alnum:]]|$)/${1}Guard${2}${3}/g


# Anti-pífies genèrics
s/çe/ce/g
s/ÇE/CE/g
s/çi/ci/g
s/ÇI/CI/g

#Apostrofacions incorrectes
s/([^_&[:alnum:]])([dD])e ([aeiouAEIOU])/${1}${2}'${3}/g
s/([^_&[:alnum:]])es ([aeiouAEIOU])/${1}s'${2}/g
s/([^_&[:alnum:]])Es ([aeiouAEIOU])/${1}s'${2}/g
s/([^_&[:alnum:]])s'([g])/${1}es ${2}/g
s/([^_&[:alnum:]])S'([g])/${1}Es ${2}/g


s/([^-|·_&[:alnum:]])([lL])a ([aeoAEO])/${1}${2}'${3}/g
	# L'apostrofament de "la [iu]" depèn de si la primera síŀlaba
	# és àtona i per tant no es pot generalitzar.
	# El "-" és per evitar pífies de l'estil "convertiu-la en -> convertiu-l'en"
	# El "·" és per evitar pífies de l'estil "Instal·la el -> Instal·l'el"
s/([^_&[:alnum:]])el ([aeiouAEIOU])/${1}l'${2}/g
s/([^_&[:alnum:]])El ([aeiouAEIOU])/${1}L'${2}/g
# anti-anti-pífia ad-hoc
s/([^_&[:alnum:]])([dD])'(UNIX|Unix|unix)/${1}${2}e ${3}/g
s/([^_&[:alnum:]])L'(UNIX|Unix|unix)/${1}El ${2}/g
s/([^_&[:alnum:]])l'(UNIX|Unix|unix)/${1}el ${2}/g

s/([[:alnum:]])àn /${1}an /g
s/([[:alnum:]])òn /${1}on /g
s/([[:alnum:]])ún /${1}un /g
	# Accents impossibles.  Podriem arribar a generar-los a les nostres
	# pròpies regles (tot i que, de moment, no conec cap lloc on ho fem)
	# "ón" no es toca per evitar problemes amb el monosíŀlab "són"

# Correcció ad hoc per a LibreOffice
s/(libreoffice\.org\/)about-vos/${1}about-us/

# Per reemplaçar Last-Translator si s'escau.
# Ha de ser al final!!  No volem que se'ns "valencianitzi" el nom o l'adreça.
#s/^(\"Last-Translator): .*\\n/${1}: Jo Mateix <jo@jo.cat>\\n/g

:END

}
