---
title: "Lab 4 Homework"
author: "Pachia Lee"
date: "2024-01-29"
output:
  html_document: 
    theme: spacelab
    keep_md: true
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse

```r
library(tidyverse)
```

## Data
For the homework, we will use data about vertebrate home range sizes. The data are in the class folder, but the reference is below.  

**Database of vertebrate home range sizes.**  
Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211. http://dx.doi.org/10.1086/682070.  
Data: http://datadryad.org/resource/doi:10.5061/dryad.q5j65/1  

**1. Load the data into a new object called `homerange`.**

```r
homerange <-read.csv("data/Tamburelloetal_HomeRangeDatabase.csv")
```

**2. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks.**  

```r
dim(homerange)
```

```
## [1] 569  24
```


```r
names(homerange)
```

```
##  [1] "taxon"                      "common.name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primarymethod"             
##  [9] "N"                          "mean.mass.g"               
## [11] "log10.mass"                 "alternative.mass.reference"
## [13] "mean.hra.m2"                "log10.hra"                 
## [15] "hra.reference"              "realm"                     
## [17] "thermoregulation"           "locomotion"                
## [19] "trophic.guild"              "dimension"                 
## [21] "preymass"                   "log10.preymass"            
## [23] "PPMR"                       "prey.size.reference"
```


```r
select_if(homerange, is.character)
```

```
##             taxon                      common.name          class
## 1     lake fishes                     american eel actinopterygii
## 2    river fishes               blacktail redhorse actinopterygii
## 3    river fishes              central stoneroller actinopterygii
## 4    river fishes                    rosyside dace actinopterygii
## 5    river fishes                    longnose dace actinopterygii
## 6    river fishes                     muskellunge  actinopterygii
## 7   marine fishes                          pollack actinopterygii
## 8   marine fishes                           saithe actinopterygii
## 9   marine fishes                lined surgeonfish actinopterygii
## 10  marine fishes          orangespine unicornfish actinopterygii
## 11  marine fishes            bluespine unicornfish actinopterygii
## 12  marine fishes                    redlip blenny actinopterygii
## 13  marine fishes                   giant trevally actinopterygii
## 14    lake fishes                        rock bass actinopterygii
## 15    lake fishes                     pumpkinseed  actinopterygii
## 16    lake fishes                        bluegill  actinopterygii
## 17   river fishes                  longear sunfish actinopterygii
## 18   river fishes                  smallmouth bass actinopterygii
## 19    lake fishes                  largemouth bass actinopterygii
## 20    lake fishes                    white crappie actinopterygii
## 21  marine fishes eastern triangular butterflyfish actinopterygii
## 22  marine fishes          Tahititan butterflyfish actinopterygii
## 23  marine fishes            chevron butterflyfish actinopterygii
## 24  marine fishes              melon butterflyfish actinopterygii
## 25  marine fishes           teardrop butterflyfish actinopterygii
## 26  marine fishes                         red moki actinopterygii
## 27  marine fishes              redspotted hawkfish actinopterygii
## 28  marine fishes                   dwarf hawkfish actinopterygii
## 29  marine fishes                          cabezon actinopterygii
## 30  marine fishes              japanese shrimpgoby actinopterygii
## 31  marine fishes                  bluebanded goby actinopterygii
## 32  marine fishes                       rusty goby actinopterygii
## 33  marine fishes                    blackeye goby actinopterygii
## 34  marine fishes                  longfinned goby actinopterygii
## 35  marine fishes                     bermuda chub actinopterygii
## 36  marine fishes                  spanish hogfish actinopterygii
## 37  marine fishes                  humphead wrasse actinopterygii
## 38  marine fishes     mediterranean rainbow wrasse actinopterygii
## 39  marine fishes                    slippery dick actinopterygii
## 40  marine fishes                yellowhead wrasse actinopterygii
## 41  marine fishes                     clown wrasse actinopterygii
## 42  marine fishes                  blackear wrasse actinopterygii
## 43  marine fishes        bluestreak cleaner wrasse actinopterygii
## 44  marine fishes                    ballan wrasse actinopterygii
## 45  marine fishes                     maori wrasse actinopterygii
## 46  marine fishes            california sheepshead actinopterygii
## 47  marine fishes                           cunner actinopterygii
## 48  marine fishes                  bluehead wrasse actinopterygii
## 49  marine fishes                      moon wrasse actinopterygii
## 50  marine fishes               thumbprint emperor actinopterygii
## 51  marine fishes                   mutton snapper actinopterygii
## 52  marine fishes             schoolmaster snapper actinopterygii
## 53  marine fishes                checkered snapper actinopterygii
## 54  marine fishes                     gray snapper actinopterygii
## 55  marine fishes               yellowtail snapper actinopterygii
## 56  marine fishes                  ocean whitefish actinopterygii
## 57  marine fishes                 european seabass actinopterygii
## 58  marine fishes                   white goatfish actinopterygii
## 59  marine fishes             whitesaddle goatfish actinopterygii
## 60    lake fishes                     yellow perch actinopterygii
## 61  marine fishes                    canary damsel actinopterygii
## 62  marine fishes                       cherubfish actinopterygii
## 63  marine fishes                       damselfish actinopterygii
## 64  marine fishes              twinspot damselfish actinopterygii
## 65  marine fishes              whitetail dascyllus actinopterygii
## 66  marine fishes                     wards damsel actinopterygii
## 67  marine fishes               australian gregory actinopterygii
## 68  marine fishes               bicolor damselfish actinopterygii
## 69  marine fishes                 cocoa damselfish actinopterygii
## 70  marine fishes             steephead parrotfish actinopterygii
## 71  marine fishes               striped parrotfish actinopterygii
## 72  marine fishes             rivulated parrotfish actinopterygii
## 73  marine fishes               redband parrotfish actinopterygii
## 74  marine fishes               redtail parrotfish actinopterygii
## 75  marine fishes                redfin parrotfish actinopterygii
## 76  marine fishes             stoplight parrotfish actinopterygii
## 77  marine fishes                     peacock hind actinopterygii
## 78  marine fishes                          graysby actinopterygii
## 79  marine fishes                   yellowfin hind actinopterygii
## 80  marine fishes                       coral hind actinopterygii
## 81  marine fishes                         red hind actinopterygii
## 82  marine fishes                    dusky grouper actinopterygii
## 83  marine fishes                      red grouper actinopterygii
## 84  marine fishes                   nassau grouper actinopterygii
## 85  marine fishes                   greasy grouper actinopterygii
## 86  marine fishes                  redbanded perch actinopterygii
## 87  marine fishes             half-banded seaperch actinopterygii
## 88  marine fishes                    black grouper actinopterygii
## 89  marine fishes                        kelp bass actinopterygii
## 90  marine fishes                 barred sand bass actinopterygii
## 91  marine fishes                    coral grouper actinopterygii
## 92  marine fishes                      coral trout actinopterygii
## 93  marine fishes                           comber actinopterygii
## 94  marine fishes                   painted comber actinopterygii
## 95  marine fishes                           salema actinopterygii
## 96  marine fishes                gilthead seabream actinopterygii
## 97   river fishes                  cutthroat trout actinopterygii
## 98   river fishes                       gila trout actinopterygii
## 99   river fishes                    rainbow trout actinopterygii
## 100  river fishes                  atlantic salmon actinopterygii
## 101   lake fishes                      brown trout actinopterygii
## 102  river fishes                  mottled sculpin actinopterygii
## 103  river fishes                   banded sculpin actinopterygii
## 104  river fishes                         sculpin  actinopterygii
## 105 marine fishes                  copper rockfish actinopterygii
## 106 marine fishes          japanese black rockfish actinopterygii
## 107 marine fishes               quillback rockfish actinopterygii
## 108 marine fishes                   black rockfish actinopterygii
## 109 marine fishes                    blue rockfish actinopterygii
## 110   lake fishes                  yellow bullhead actinopterygii
## 111 marine fishes            long-snouted seahorse actinopterygii
## 112 marine fishes                    worm pipefish actinopterygii
## 113 marine fishes        atlantic sharpnose puffer actinopterygii
## 114         birds                     golden eagle           aves
## 115         birds                   common buzzard           aves
## 116         birds           short-toed snake eagle           aves
## 117         birds                  Bonelli's eagle           aves
## 118         birds                     booted eagle           aves
## 119         birds                 Egyptian vulture           aves
## 120         birds                          gadwall           aves
## 121         birds              northern brown kiwi           aves
## 122         birds                European nightjar           aves
## 123         birds                    oystercatcher           aves
## 124         birds                        inca dove           aves
## 125         birds               common wood pigeon           aves
## 126         birds             European turtle dove           aves
## 127         birds                  European roller           aves
## 128         birds                           hoopoe           aves
## 129         birds             great spotted cuckoo           aves
## 130         birds                    common cuckoo           aves
## 131         birds               greater roadrunner           aves
## 132         birds             banded ground-cuckoo           aves
## 133         birds                    Cooper's hawk           aves
## 134         birds                 Northern goshawk           aves
## 135         birds             Eurasian sparrowhawk           aves
## 136         birds               sharp-shinned hawk           aves
## 137         birds                  red-tailed hawk           aves
## 138         birds              red-shouldered hawk           aves
## 139         birds                  Swainson's hawk           aves
## 140         birds                      hen harrier           aves
## 141         birds                Montagu's harrier           aves
## 142         birds                         red kite           aves
## 143         birds                         caracara           aves
## 144         birds            red-throated caracara           aves
## 145         birds                    lanner falcon           aves
## 146         birds                   prairie falcon           aves
## 147         birds                 peregrine falcon           aves
## 148         birds                 American kestrel           aves
## 149         birds                 European kestrel           aves
## 150         birds                     hazel grouse           aves
## 151         birds                      sage grouse           aves
## 152         birds                     dusky grouse           aves
## 153         birds                 willow ptarmigan           aves
## 154         birds                   grey partridge           aves
## 155         birds                     black grouse           aves
## 156         birds             western capercaillie           aves
## 157         birds          greater prairie-chicken           aves
## 158         birds                  brown wood rail           aves
## 159         birds                        corncrake           aves
## 160         birds                        king rail           aves
## 161         birds                melodious warbler           aves
## 162         birds                  long-tailed tit           aves
## 163         birds                         woodlark           aves
## 164         birds         red-throated ant tanager           aves
## 165         birds          red-crowned ant tanager           aves
## 166         birds             Eurasian treecreeper           aves
## 167         birds         streaked fantail warbler           aves
## 168         birds                     common raven           aves
## 169         birds               spotted nutcracker           aves
## 170         birds             Peruvian plantcutter           aves
## 171         birds              grasshopper sparrow           aves
## 172         birds                   indigo bunting           aves
## 173         birds                   Abert's towhee           aves
## 174         birds                    canyon towhee           aves
## 175         birds            American tree sparrow           aves
## 176         birds                 chipping sparrow           aves
## 177         birds                    common linnet           aves
## 178         birds                 common chaffinch           aves
## 179         birds                   European serin           aves
## 180         birds               eastern meadowlark           aves
## 181         birds               western meadowlard           aves
## 182         birds             yellow-breasted chat           aves
## 183         birds                red-backed shrike           aves
## 184         birds                loggerhead shrike           aves
## 185         birds               lesser grey shrike           aves
## 186         birds                  woodchat shrike           aves
## 187         birds             northern mockingbird           aves
## 188         birds                    white wagtail           aves
## 189         birds           western yellow wagtail           aves
## 190         birds               spotted flycatcher           aves
## 191         birds                northern wheatear           aves
## 192         birds                  common redstart           aves
## 193         birds                         whinchat           aves
## 194         birds           black-capped chickadee           aves
## 195         birds               Carolina chickadee           aves
## 196         birds                     Oak titmouse           aves
## 197         birds                        marsh tit           aves
## 198         birds                 mourning warbler           aves
## 199         birds              common yellowthroat           aves
## 200         birds             prothonotary warbler           aves
## 201         birds                         ovenbird           aves
## 202         birds             Blackburnian warbler           aves
## 203         birds               Kirtland's warbler           aves
## 204         birds                 magnolia warbler           aves
## 205         birds           chestnut-sided warbler           aves
## 206         birds          American yellow warbler           aves
## 207         birds                American redstart           aves
## 208         birds     black-throated green warbler           aves
## 209         birds                   Canada warbler           aves
## 210         birds        Western Bonelli's warbler           aves
## 211         birds           tooth-billed bowerbird           aves
## 212         birds                 common firecrest           aves
## 213         birds                        goldcrest           aves
## 214         birds                European nuthatch           aves
## 215         birds                          wrentit           aves
## 216         birds                Marmora's warbler           aves
## 217         birds                 Dartford warbler           aves
## 218         birds                   Berwick's wren           aves
## 219         birds                    Carolina wren           aves
## 220         birds                       house wren           aves
## 221         birds                    Eurasian wren           aves
## 222         birds                 eastern bluebird           aves
## 223         birds               eastern wood pewee           aves
## 224         birds                 least flycatcher           aves
## 225         birds         American gray flycatcher           aves
## 226         birds                 eastern kingbird           aves
## 227         birds               black-capped vireo           aves
## 228         birds                     Bell's vireo           aves
## 229         birds                 white-eyed vireo           aves
## 230         birds                   red-eyed vireo           aves
## 231         birds                    great bittern           aves
## 232         birds                    least bittern           aves
## 233         birds                 black woodpecker           aves
## 234         birds                 Eurasian wryneck           aves
## 235         birds          white-backed woodpecker           aves
## 236         birds       middle spotted woodpeckers           aves
## 237         birds   Eurasian three-toed woodpecker           aves
## 238         birds           grey-headed woodpecker           aves
## 239         birds        European green woodpecker           aves
## 240         birds                           kakapo           aves
## 241         birds                     greater rhea           aves
## 242         birds                      lesser rhea           aves
## 243         birds                       boreal owl           aves
## 244         birds                   long-eared owl           aves
## 245         birds                       little owl           aves
## 246         birds               Eurasian eagle-owl           aves
## 247         birds                 great horned owl           aves
## 248         birds               Eurasian pygmy owl           aves
## 249         birds                        snowy owl           aves
## 250         birds                        tawny owl           aves
## 251         birds                         barn owl           aves
## 252         birds                          ostrich           aves
## 253         birds                   ornate tinamou           aves
## 254       mammals                giant golden mole       mammalia
## 255       mammals              Grant's golden mole       mammalia
## 256       mammals                        pronghorn       mammalia
## 257       mammals                           impala       mammalia
## 258       mammals                       hartebeest       mammalia
## 259       mammals                    barbary sheep       mammalia
## 260       mammals                   American bison       mammalia
## 261       mammals                   European bison       mammalia
## 262       mammals                             goat       mammalia
## 263       mammals                     Spanish ibex       mammalia
## 264       mammals                   Peter's dukier       mammalia
## 265       mammals                       bay dikier       mammalia
## 266       mammals                 mountain gazelle       mammalia
## 267       mammals             G\xfcnther's dik-dik       mammalia
## 268       mammals                    mountain goat       mammalia
## 269       mammals                           argali       mammalia
## 270       mammals                    bighorn sheep       mammalia
## 271       mammals                         steenbok       mammalia
## 272       mammals                          chamois       mammalia
## 273       mammals                     common eland       mammalia
## 274       mammals                         bushbuck       mammalia
## 275       mammals                     greater kudu       mammalia
## 276       mammals                            moose       mammalia
## 277       mammals                           chital       mammalia
## 278       mammals                         roe deer       mammalia
## 279       mammals                         red deer       mammalia
## 280       mammals                        sika deer       mammalia
## 281       mammals                      fallow deer       mammalia
## 282       mammals                 Reeves's muntjac       mammalia
## 283       mammals                        mule deer       mammalia
## 284       mammals                white-tailed deer       mammalia
## 285       mammals                      pampas deer       mammalia
## 286       mammals                             pudu       mammalia
## 287       mammals                         reindeer       mammalia
## 288       mammals                          giraffe       mammalia
## 289       mammals                            okapi       mammalia
## 290       mammals                   desert warthog       mammalia
## 291       mammals                  Chacoan peccary       mammalia
## 292       mammals                 collared peccary       mammalia
## 293       mammals             white-lipped peccary       mammalia
## 294       mammals                 water chevrotain       mammalia
## 295       mammals                        red panda       mammalia
## 296       mammals                       arctic fox       mammalia
## 297       mammals                   Ethiopian wolf       mammalia
## 298       mammals                           culpeo       mammalia
## 299       mammals          South American gray fox       mammalia
## 300       mammals                          kit fox       mammalia
## 301       mammals                     Ruppel's fox       mammalia
## 302       mammals                        swift fox       mammalia
## 303       mammals   thick-tailed three-toed jerboa       mammalia
## 304       mammals                            fossa       mammalia
## 305       mammals                          cheetah       mammalia
## 306       mammals                          caracal       mammalia
## 307       mammals                              cat       mammalia
## 308       mammals                          wildcat       mammalia
## 309       mammals                       jaguarundi       mammalia
## 310       mammals                           ocelot       mammalia
## 311       mammals                           margay       mammalia
## 312       mammals                           serval       mammalia
## 313       mammals                      Canada lynx       mammalia
## 314       mammals                    Eurasian lynx       mammalia
## 315       mammals                     Iberian lynx       mammalia
## 316       mammals                           bobcat       mammalia
## 317       mammals                   Geoffroy's cat       mammalia
## 318       mammals                           jaguar       mammalia
## 319       mammals                          leopard       mammalia
## 320       mammals                            tiger       mammalia
## 321       mammals                      leopard cat       mammalia
## 322       mammals                           cougar       mammalia
## 323       mammals                     snow leopard       mammalia
## 324       mammals                   marsh mongoose       mammalia
## 325       mammals                  yellow mongoose       mammalia
## 326       mammals            common dwarf mongoose       mammalia
## 327       mammals                Egyptian mongoose       mammalia
## 328       mammals            white-tailed mongoose       mammalia
## 329       mammals                         aardwolf       mammalia
## 330       mammals                            tayra       mammalia
## 331       mammals                   greater grison       mammalia
## 332       mammals                        wolverine       mammalia
## 333       mammals                  American marten       mammalia
## 334       mammals                     beech marten       mammalia
## 335       mammals             European pine marten       mammalia
## 336       mammals                           fisher       mammalia
## 337       mammals                            stoat       mammalia
## 338       mammals               long-tailed weasel       mammalia
## 339       mammals                           ferret       mammalia
## 340       mammals                    European mink       mammalia
## 341       mammals              black-footed ferret       mammalia
## 342       mammals                     least weasel       mammalia
## 343       mammals                  Siberian weasel       mammalia
## 344       mammals                  American badger       mammalia
## 345       mammals                         kinkajou       mammalia
## 346       mammals                      giant panda       mammalia
## 347       mammals                       sloth bear       mammalia
## 348       mammals                     common genet       mammalia
## 349       mammals                       cape genet       mammalia
## 350       mammals               large indian civet       mammalia
## 351       mammals                    Western quoll       mammalia
## 352       mammals                      tiger quoll       mammalia
## 353       mammals             white-footed dunnart       mammalia
## 354       mammals                 brown antechinus       mammalia
## 355       mammals   Northern three-striped opossum       mammalia
## 356       mammals       elegant fat-tailed opossum       mammalia
## 357       mammals         Lumholtz's tree-kangaroo       mammalia
## 358       mammals              antilopine kangaroo       mammalia
## 359       mammals            black-striped wallaby       mammalia
## 360       mammals            Western grey kangaroo       mammalia
## 361       mammals            Eastern grey kangaroo       mammalia
## 362       mammals                  common wallaroo       mammalia
## 363       mammals               red-necked wallaby       mammalia
## 364       mammals                     red kangaroo       mammalia
## 365       mammals              allied rock-wallaby       mammalia
## 366       mammals                  eastern bettong       mammalia
## 367       mammals              long-footed potoroo       mammalia
## 368       mammals                   greater glider       mammalia
## 369       mammals        bridled nail-tail wallaby       mammalia
## 370       mammals             red-legged pademelon       mammalia
## 371       mammals             red-necked pademelon       mammalia
## 372       mammals                    swamp wallaby       mammalia
## 373       mammals          common brushtail possum       mammalia
## 374       mammals      northern hairy-nosed wombat       mammalia
## 375       mammals                    common wombat       mammalia
## 376       mammals                European hedgehog       mammalia
## 377       mammals              long-eared hedgehog       mammalia
## 378       mammals                     pygmy rabbit       mammalia
## 379       mammals                    snowshoe hare       mammalia
## 380       mammals                      Arctic hare       mammalia
## 381       mammals          black-tailed jackrabbit       mammalia
## 382       mammals                        cape hare       mammalia
## 383       mammals                    European hare       mammalia
## 384       mammals                      Indian hare       mammalia
## 385       mammals                    mountain hare       mammalia
## 386       mammals                  European rabbit       mammalia
## 387       mammals                     swamp rabbit       mammalia
## 388       mammals               eastern cottontail       mammalia
## 389       mammals                     marsh rabbit       mammalia
## 390       mammals                     plateau pika       mammalia
## 391       mammals                    American pika       mammalia
## 392       mammals            rufous elephant shrew       mammalia
## 393       mammals         four-toed elephant shrew       mammalia
## 394       mammals     golden-rumped elephant shrew       mammalia
## 395       mammals            east African mole rat       mammalia
## 396       mammals                 golden bandicoot       mammalia
## 397       mammals         Southern brown bandicoot       mammalia
## 398       mammals                            horse       mammalia
## 399       mammals                 white rhinoceros       mammalia
## 400       mammals                 black rhinoceros       mammalia
## 401       mammals                      maned sloth       mammalia
## 402       mammals                   Asian elephant       mammalia
## 403       mammals            African bush elephant       mammalia
## 404       mammals       southern grasshopper mouse       mammalia
## 405       mammals                  mountain beaver       mammalia
## 406       mammals               cape dune mole rat       mammalia
## 407       mammals              Damaraland mole rat       mammalia
## 408       mammals                  common mole rat       mammalia
## 409       mammals                    cape mole rat       mammalia
## 410       mammals                 silvery mole rat       mammalia
## 411       mammals                   naked mole rat       mammalia
## 412       mammals                  Patagonian mara       mammalia
## 413       mammals                  plains viscacha       mammalia
## 414       mammals          western red-backed vole       mammalia
## 415       mammals            large-headed rice rat       mammalia
## 416       mammals           Siberian brown lemming       mammalia
## 417       mammals                       field vole       mammalia
## 418       mammals                  California vole       mammalia
## 419       mammals                     montane vole       mammalia
## 420       mammals                     prairie vole       mammalia
## 421       mammals                      meadow vole       mammalia
## 422       mammals                    woodland vole       mammalia
## 423       mammals                       water vole       mammalia
## 424       mammals                     wood lemming       mammalia
## 425       mammals             bushy-tailed woodrat       mammalia
## 426       mammals             dusky-footed woodrat       mammalia
## 427       mammals                   desert woodrat       mammalia
## 428       mammals          Southern plains woodrat       mammalia
## 429       mammals                          muskrat       mammalia
## 430       mammals                     cotton mouse       mammalia
## 431       mammals         salt marsh harvest mouse       mammalia
## 432       mammals             southern bog lemming       mammalia
## 433       mammals          dwarf fat-tailed jerboa       mammalia
## 434       mammals               Cuvier's spiny rat       mammalia
## 435       mammals                 Tome's spiny rat       mammalia
## 436       mammals              Brazilian porcupine       mammalia
## 437       mammals         North American porcupine       mammalia
## 438       mammals            Botta's pocket gopher       mammalia
## 439       mammals              spectacled dormouse       mammalia
## 440       mammals                   hazel dormouse       mammalia
## 441       mammals               giant kangaroo rat       mammalia
## 442       mammals           Merriam's kangaroo rat       mammalia
## 443       mammals               Ord's kangaroo rat       mammalia
## 444       mammals       banner-tailed kangaroo rat       mammalia
## 445       mammals           Stephen's kangaroo rat       mammalia
## 446       mammals                   cape porcupine       mammalia
## 447       mammals         Indian crested porcupine       mammalia
## 448       mammals   African brush-tailed porcupine       mammalia
## 449       mammals              yellow-necked mouse       mammalia
## 450       mammals                       wood mouse       mammalia
## 451       mammals               Indian desert jird       mammalia
## 452       mammals              broad-toothed mouse       mammalia
## 453       mammals               Malagasy giant rat       mammalia
## 454       mammals         White-bellied\xa0nesomys       mammalia
## 455       mammals                     island mouse       mammalia
## 456       mammals                           coruro       mammalia
## 457       mammals                Siberian chipmunk       mammalia
## 458       mammals           Northern parl squirrel       mammalia
## 459       mammals         Northern flying squirrel       mammalia
## 460       mammals         Southern flying squirrel       mammalia
## 461       mammals            yellow-bellied marmot       mammalia
## 462       mammals                        groundhog       mammalia
## 463       mammals                red bush squirrel       mammalia
## 464       mammals                 Abert's squirrel       mammalia
## 465       mammals            eastern gray squirrel       mammalia
## 466       mammals                Japanese squirrel       mammalia
## 467       mammals                     fox squirrel       mammalia
## 468       mammals                     red squirrel       mammalia
## 469       mammals       California ground squirrel       mammalia
## 470       mammals        Columbian ground squirrel       mammalia
## 471       mammals       Franklin's ground squirrel       mammalia
## 472       mammals           arctic ground squirrel       mammalia
## 473       mammals          spotted ground squirrel       mammalia
## 474       mammals   thirteen-lined ground squirrel       mammalia
## 475       mammals                    rock squirrel       mammalia
## 476       mammals             yellow-pine chipmunk       mammalia
## 477       mammals                   least chipmunk       mammalia
## 478       mammals                Colorado chipmunk       mammalia
## 479       mammals                   Uinta chipmunk       mammalia
## 480       mammals            American red squirrel       mammalia
## 481       mammals          striped ground squirrel       mammalia
## 482       mammals       greater white-footed shrew       mammalia
## 483       mammals                     arctic shrew       mammalia
## 484       mammals                   cinereus shrew       mammalia
## 485       mammals                    crowned shrew       mammalia
## 486       mammals                    slender shrew       mammalia
## 487       mammals                long-clawed shrew       mammalia
## 488       mammals                  star-nosed mole       mammalia
## 489       mammals                     eastern mole       mammalia
## 490       mammals                    European mole       mammalia
## 491       mammals                       Roman mole       mammalia
## 492       lizards                spiny tail lizard       reptilia
## 493        snakes               western worm snake       reptilia
## 494        snakes               eastern worm snake       reptilia
## 495        snakes                            racer       reptilia
## 496        snakes             yellow bellied racer       reptilia
## 497        snakes                   ringneck snake       reptilia
## 498        snakes             eastern indigo snake       reptilia
## 499        snakes            great plains ratsnake       reptilia
## 500        snakes                 western ratsnake       reptilia
## 501        snakes                    hognose snake       reptilia
## 502        snakes               European whipsnake       reptilia
## 503        snakes                Eastern kingsnake       reptilia
## 504        snakes                        milksnake       reptilia
## 505        snakes                        coachwhip       reptilia
## 506        snakes                      grass snake       reptilia
## 507        snakes           copperbelly watersnake       reptilia
## 508        snakes              Northern watersnake       reptilia
## 509        snakes               redbacked ratsnake       reptilia
## 510        snakes                     gopher snake       reptilia
## 511        snakes                       pine snake       reptilia
## 512        snakes             butlers garter snake       reptilia
## 513        snakes              giant garter snakes       reptilia
## 514        snakes                Aesculapian snake       reptilia
## 515        snakes                broadheaded snake       reptilia
## 516        snakes                      tiger snake       reptilia
## 517        snakes                       blacksnake       reptilia
## 518       lizards            Galapagos land iguana       reptilia
## 519       lizards           Bahamian Andros iguana       reptilia
## 520       lizards                      blue iguana       reptilia
## 521       lizards            Anegada ground iguana       reptilia
## 522       lizards          Angel island chuckwalla       reptilia
## 523       lizards                common chuckwalla       reptilia
## 524       lizards                    desert iguana       reptilia
## 525       lizards                  Tenerife lizard       reptilia
## 526       lizards             High Mountain Lizard       reptilia
## 527        snakes       southwestern carpet python       reptilia
## 528       lizards                      land mullet       reptilia
## 529        snakes                       copperhead       reptilia
## 530        snakes                      cottonmouth       reptilia
## 531        snakes              namaqua dwarf adder       reptilia
## 532        snakes                     fer-de-lance       reptilia
## 533        snakes              western diamondback       reptilia
## 534        snakes                       sidewinder       reptilia
## 535        snakes               timber rattlesnake       reptilia
## 536        snakes          blacktailed rattlesnake       reptilia
## 537        snakes         midget faded rattlesnake       reptilia
## 538        snakes         twin-spotted rattlesnake       reptilia
## 539        snakes               Mojave rattlesnake       reptilia
## 540        snakes                tiger rattlesnake       reptilia
## 541        snakes                chinese pit viper       reptilia
## 542        snakes                   Armenian viper       reptilia
## 543        snakes                  snubnosed viper       reptilia
## 544       turtles       Eastern long-necked turtle       reptilia
## 545       turtles      Dalh's toad-headed tortoise       reptilia
## 546       turtles           common snapping turtle       reptilia
## 547       turtles           midland painted turtle       reptilia
## 548       turtles                   chicken turtle       reptilia
## 549       turtles                Blanding's turtle       reptilia
## 550       turtles             European pond turtle       reptilia
## 551       turtles       yellow-blotched map turtle       reptilia
## 552       turtles                ornate box turtle       reptilia
## 553       turtles              Spanish pond turtle       reptilia
## 554       turtles               Eastern mud turtle       reptilia
## 555       turtles        stripe-necked musk turtle       reptilia
## 556       turtles                  stinkpot turtle       reptilia
## 557     tortoises              red-footed tortoise       reptilia
## 558     tortoises                  desert tortoise       reptilia
## 559     tortoises                  gopher tortoise       reptilia
## 560     tortoises              travancore tortoise       reptilia
## 561     tortoises    Speke's hinge-backed tortoise       reptilia
## 562     tortoises               impressed tortoise       reptilia
## 563     tortoises        bushmanland tent tortoise       reptilia
## 564     tortoises                 leopard tortoise       reptilia
## 565     tortoises            spur-thighed tortoise       reptilia
## 566     tortoises           mediterranean tortoise       reptilia
## 567     tortoises          Russian steppe tortoise       reptilia
## 568     tortoises                Egyptian tortoise       reptilia
## 569       turtles   Eastern spiny softshell turtle       reptilia
##                     order            family           genus
## 1          anguilliformes       anguillidae        anguilla
## 2           cypriniformes      catostomidae       moxostoma
## 3           cypriniformes        cyprinidae      campostoma
## 4           cypriniformes        cyprinidae     clinostomus
## 5           cypriniformes        cyprinidae     rhinichthys
## 6             esociformes          esocidae            esox
## 7              gadiformes           gadidae      pollachius
## 8              gadiformes           gadidae      pollachius
## 9             perciformes      acanthuridae      acanthurus
## 10            perciformes      acanthuridae            naso
## 11            perciformes      acanthuridae            naso
## 12            perciformes         blennidae   ophioblennius
## 13            perciformes        carangidae          caranx
## 14            perciformes     centrarchidae     ambloplites
## 15            perciformes     centrarchidae         lepomis
## 16            perciformes     centrarchidae         lepomis
## 17            perciformes     centrarchidae         lepomis
## 18            perciformes     centrarchidae     micropterus
## 19            perciformes     centrarchidae     micropterus
## 20            perciformes     centrarchidae         pomoxis
## 21            perciformes    chaetodontidae       chaetodon
## 22            perciformes    chaetodontidae       chaetodon
## 23            perciformes    chaetodontidae       chaetodon
## 24            perciformes    chaetodontidae       chaetodon
## 25            perciformes    chaetodontidae       chaetodon
## 26            perciformes  cheilodactylidae  cheilodactylus
## 27            perciformes       cirrhitidae  amblycirrhitus
## 28            perciformes       cirrhitidae  cirrhitichthys
## 29            perciformes          cottidae scorpaenichthys
## 30            perciformes          gobiidae   amblyeleotris
## 31            perciformes          gobiidae      lythrypnus
## 32            perciformes          gobiidae       priolepis
## 33            perciformes          gobiidae    rhinogobiops
## 34            perciformes          gobiidae    valenciennea
## 35            perciformes        kyphosidae        kyphosus
## 36            perciformes          labridae        bodianus
## 37            perciformes          labridae        chelinus
## 38            perciformes          labridae           coris
## 39            perciformes          labridae     halichoeres
## 40            perciformes          labridae     halichoeres
## 41            perciformes          labridae     halichoeres
## 42            perciformes          labridae     halichoeres
## 43            perciformes          labridae       labroides
## 44            perciformes          labridae          labrus
## 45            perciformes          labridae   opthalmolepis
## 46            perciformes          labridae   semicossyphus
## 47            perciformes          labridae   tautogolabrus
## 48            perciformes          labridae      thalassoma
## 49            perciformes          labridae      thalassoma
## 50            perciformes       lethrinidae       lethrinus
## 51            perciformes        lutjanidae        lutjanus
## 52            perciformes        lutjanidae        lutjanus
## 53            perciformes        lutjanidae        lutjanus
## 54            perciformes        lutjanidae        lutjanus
## 55            perciformes        lutjanidae         ocyurus
## 56            perciformes     malacanthidae    caulolatilus
## 57            perciformes         moronidae   dicentrarchus
## 58            perciformes          mullidae  mulloidichthys
## 59            perciformes          mullidae      parupeneus
## 60            perciformes          percidae           perca
## 61            perciformes     pomacanthidae       abudefduf
## 62            perciformes     pomacanthidae      centropyge
## 63            perciformes     pomacentridae         chromis
## 64            perciformes     pomacentridae     chrysiptera
## 65            perciformes     pomacentridae       dascyllus
## 66            perciformes     pomacentridae     pomacentrus
## 67            perciformes     pomacentridae       stegastes
## 68            perciformes     pomacentridae       stegastes
## 69            perciformes     pomacentridae       stegastes
## 70            perciformes          scaridae       chlorurus
## 71            perciformes          scaridae          scarus
## 72            perciformes          scaridae          scarus
## 73            perciformes          scaridae       sparisoma
## 74            perciformes          scaridae       sparisoma
## 75            perciformes          scaridae       sparisoma
## 76            perciformes          scaridae       sparisoma
## 77            perciformes        serranidae   cephalopholis
## 78            perciformes        serranidae   cephalopholis
## 79            perciformes        serranidae   cephalopholis
## 80            perciformes        serranidae   cephalopholis
## 81            perciformes        serranidae     epinephelus
## 82            perciformes        serranidae     epinephelus
## 83            perciformes        serranidae     epinephelus
## 84            perciformes        serranidae     epinephelus
## 85            perciformes        serranidae     epinephelus
## 86            perciformes        serranidae  hypoplectrodes
## 87            perciformes        serranidae  hypoplectrodes
## 88            perciformes        serranidae    mycteroperca
## 89            perciformes        serranidae      paralabrax
## 90            perciformes        serranidae      paralabrax
## 91            perciformes        serranidae    plectropomus
## 92            perciformes        serranidae    plectropomus
## 93            perciformes        serranidae        serranus
## 94            perciformes        serranidae        serranus
## 95            perciformes          sparidae           sarpa
## 96            perciformes          sparidae          sparus
## 97          salmoniformes        salmonidae    oncorhynchus
## 98          salmoniformes        salmonidae    oncorhynchus
## 99          salmoniformes        salmonidae    oncorhynchus
## 100         salmoniformes        salmonidae           salmo
## 101         salmoniformes        salmonidae           salmo
## 102       scorpaeniformes          cottidae          cottus
## 103       scorpaeniformes          cottidae          cottus
## 104       scorpaeniformes          cottidae          cottus
## 105       scorpaeniformes        sebastidae        sebastes
## 106       scorpaeniformes        sebastidae        sebastes
## 107       scorpaeniformes        sebastidae        sebastes
## 108       scorpaeniformes        sebastidae        sebastes
## 109       scorpaeniformes        sebastidae        sebastes
## 110          siluriformes       ictaluridae       ictalurus
## 111       syngnathiformes      syngnathidae     hippocampus
## 112       syngnathiformes      syngnathidae        nerophis
## 113 tetraodontiformes\xa0    tetraodontidae    canthigaster
## 114       accipitriformes      accipitridae          aquila
## 115       accipitriformes      accipitridae           buteo
## 116       accipitriformes      accipitridae       circaetus
## 117       accipitriformes      accipitridae      hieraaetus
## 118       accipitriformes      accipitridae      hieraaetus
## 119       accipitriformes      accipitridae        neophron
## 120          anseriformes          anatidae            anas
## 121        apterygiformes       apterygidae         apteryx
## 122      caprimulgiformes     caprimulgidae     caprimulgus
## 123       charadriiformes    haematopodidae      haematopus
## 124         columbidormes        columbidae     scardafella
## 125         columbiformes        columbidae         columba
## 126         columbiformes        columbidae    streptopelia
## 127         coraciiformes        coraciidae        coracias
## 128         coraciiformes          upupidae           upupa
## 129          cuculiformes         cuculidae        clamator
## 130          cuculiformes         cuculidae         cuculus
## 131          cuculiformes         cuculidae       geococcyx
## 132          cuculiformes         cuculidae     neopmorphus
## 133         falconiformes      accipitridae       accipiter
## 134         falconiformes      accipitridae       accipiter
## 135         falconiformes      accipitridae       accipiter
## 136         falconiformes      accipitridae       accipiter
## 137         falconiformes      accipitridae           buteo
## 138         falconiformes      accipitridae           buteo
## 139         falconiformes      accipitridae           buteo
## 140         falconiformes      accipitridae          circus
## 141         falconiformes      accipitridae          circus
## 142         falconiformes      accipitridae          milvus
## 143         falconiformes        falconidae        caracara
## 144         falconiformes        falconidae        daptrius
## 145         falconiformes        falconidae           falco
## 146         falconiformes        falconidae           falco
## 147         falconiformes        falconidae           falco
## 148         falconiformes        falconidae           falco
## 149         falconiformes        falconidae           falco
## 150           galliformes       phasianidae          bonasa
## 151           galliformes       phasianidae    centrocercus
## 152           galliformes       phasianidae     dendragapus
## 153           galliformes       phasianidae         lagopus
## 154           galliformes       phasianidae          perdix
## 155           galliformes       phasianidae          tetrao
## 156           galliformes       phasianidae          tetrao
## 157           galliformes       phasianidae     typmanuchus
## 158            gruiformes          rallidae        aramides
## 159            gruiformes          rallidae            crex
## 160            gruiformes          rallidae          rallus
## 161         passeriformes    acrocephalisae       hippolais
## 162         passeriformes      aegithalidae      aegithalos
## 163         passeriformes         alaudidae         lululla
## 164         passeriformes      cardinalidae           habia
## 165         passeriformes      cardinalidae           habia
## 166         passeriformes         certhidae         certhia
## 167         passeriformes      cisticolidae       cisticola
## 168         passeriformes          corvidae          corvus
## 169         passeriformes          corvidae       nucifraga
## 170         passeriformes        cotingidae       phytotoma
## 171         passeriformes       emberizidae      ammodramus
## 172         passeriformes       emberizidae       passerina
## 173         passeriformes       emberizidae          pipilo
## 174         passeriformes       emberizidae          pipilo
## 175         passeriformes       emberizidae        spizella
## 176         passeriformes       emberizidae        spizella
## 177         passeriformes      fringillidae       carduelis
## 178         passeriformes      fringillidae       fringilla
## 179         passeriformes      fringillidae         serinus
## 180         passeriformes         icteridae       sturnella
## 181         passeriformes         icteridae       sturnella
## 182         passeriformes          incertae         icteria
## 183         passeriformes          laniidae         laniuis
## 184         passeriformes          laniidae         laniuis
## 185         passeriformes          laniidae          lanius
## 186         passeriformes          laniidae          lanius
## 187         passeriformes           mimidae           mimus
## 188         passeriformes      motacillidae       motacilla
## 189         passeriformes      motacillidae       motacilla
## 190         passeriformes      muscicapidae       muscicapa
## 191         passeriformes      muscicapidae        oenanthe
## 192         passeriformes      muscicapidae     phoenicurus
## 193         passeriformes      muscicapidae        saxicola
## 194         passeriformes           paridae           parus
## 195         passeriformes           paridae           parus
## 196         passeriformes           paridae           parus
## 197         passeriformes           paridae           parus
## 198         passeriformes         parulidae  geothlypis\xa0
## 199         passeriformes         parulidae      geothylpis
## 200         passeriformes         parulidae    protonotaria
## 201         passeriformes         parulidae         seiurus
## 202         passeriformes         parulidae       setophaga
## 203         passeriformes         parulidae       setophaga
## 204         passeriformes         parulidae       setophaga
## 205         passeriformes         parulidae       setophaga
## 206         passeriformes         parulidae       setophaga
## 207         passeriformes         parulidae       setophaga
## 208         passeriformes         parulidae       setophaga
## 209         passeriformes         parulidae        wilsonia
## 210         passeriformes    phylloscopidae    phylloscopus
## 211         passeriformes ptilonorhynchidae    scenopoeetes
## 212         passeriformes         regulidae         regulus
## 213         passeriformes         regulidae         regulus
## 214         passeriformes         stittidae           sitta
## 215         passeriformes          sylvidae         chamaea
## 216         passeriformes         sylviidae          sylvia
## 217         passeriformes         sylviidae          sylvia
## 218         passeriformes     troglodytidae      thryomanes
## 219         passeriformes     troglodytidae     thryothorus
## 220         passeriformes     troglodytidae     troglodytes
## 221         passeriformes     troglodytidae     troglodytes
## 222         passeriformes          turdidae          sialia
## 223         passeriformes        tyrannidae        contopus
## 224         passeriformes        tyrannidae       empidonax
## 225         passeriformes        tyrannidae       empidonax
## 226         passeriformes        tyrannidae        tyrannus
## 227         passeriformes        vireonidae           vireo
## 228         passeriformes        vireonidae           vireo
## 229         passeriformes        vireonidae           vireo
## 230         passeriformes        vireonidae           vireo
## 231        pelecaniformes          ardeidae        botaurus
## 232        pelecaniformes          ardeidae      ixobrychus
## 233            piciformes           picidae       dryocopus
## 234            piciformes           picidae            jynx
## 235            piciformes           picidae        picoides
## 236            piciformes           picidae        picoides
## 237            piciformes           picidae        picoides
## 238            piciformes           picidae           picus
## 239            piciformes           picidae           picus
## 240        psittaciformes       strigopidae        strigops
## 241            rheiformes           rheidae            rhea
## 242            rheiformes           rheidae            rhea
## 243          strigiformes         strigidae        aegolius
## 244          strigiformes         strigidae            asio
## 245          strigiformes         strigidae          athene
## 246          strigiformes         strigidae            bubo
## 247          strigiformes         strigidae            bubo
## 248          strigiformes         strigidae      glaucidium
## 249          strigiformes         strigidae          nyctea
## 250          strigiformes         strigidae           strix
## 251          strigiformes         tytonidae            tyto
## 252      struthioniformes     struthionidae        struthio
## 253          tinamiformes         tinamidae     nothoprocta
## 254          afrosoricida   chrysochloridae    chrysospalax
## 255          afrosoricida   chrysochloridae      eremitalpa
## 256          artiodactyla    antilocapridae     antilocapra
## 257          artiodactyla           bovidae       aepyceros
## 258          artiodactyla           bovidae      alcelaphus
## 259          artiodactyla           bovidae      ammotragus
## 260          artiodactyla           bovidae           bison
## 261          artiodactyla           bovidae           bison
## 262          artiodactyla           bovidae           capra
## 263          artiodactyla           bovidae           capra
## 264          artiodactyla           bovidae     cephalophus
## 265          artiodactyla           bovidae     cephalophus
## 266          artiodactyla           bovidae         gazella
## 267          artiodactyla           bovidae         madoqua
## 268          artiodactyla           bovidae        oreamnos
## 269          artiodactyla           bovidae            ovis
## 270          artiodactyla           bovidae            ovis
## 271          artiodactyla           bovidae      raphicerus
## 272          artiodactyla           bovidae       rupicapra
## 273          artiodactyla           bovidae     taurotragus
## 274          artiodactyla           bovidae     tragelaphus
## 275          artiodactyla           bovidae     tragelaphus
## 276          artiodactyla          cervidae           alces
## 277          artiodactyla          cervidae            axis
## 278          artiodactyla          cervidae       capreolus
## 279          artiodactyla          cervidae          cervus
## 280          artiodactyla          cervidae          cervus
## 281          artiodactyla          cervidae            dama
## 282          artiodactyla          cervidae       muntiacus
## 283          artiodactyla          cervidae      odocoileus
## 284          artiodactyla          cervidae      odocoileus
## 285          artiodactyla          cervidae      ozotoceros
## 286          artiodactyla          cervidae            pudu
## 287          artiodactyla          cervidae        rangifer
## 288          artiodactyla        giraffidae         giraffa
## 289          artiodactyla        giraffidae          okapia
## 290          artiodactyla            suidae    phacochoerus
## 291          artiodactyla       tayassuidae       catagonus
## 292          artiodactyla       tayassuidae          pecari
## 293          artiodactyla       tayassuidae         tayassu
## 294          artiodactyla        tragulidae      hyemoschus
## 295             carnivora         ailuridae         ailurus
## 296             carnivora           canidae          alopex
## 297             carnivora           canidae           canis
## 298             carnivora           canidae     pseudalopex
## 299             carnivora           canidae     pseudalopex
## 300             carnivora           canidae          vulpes
## 301             carnivora           canidae          vulpes
## 302             carnivora           canidae          vulpes
## 303             carnivora         dipodidae      stylodipus
## 304             carnivora        eupleridae    cryptoprocta
## 305             carnivora           felidae        acinonyx
## 306             carnivora           felidae         caracal
## 307             carnivora           felidae           felis
## 308             carnivora           felidae           felis
## 309             carnivora           felidae     herpailurus
## 310             carnivora           felidae       leopardus
## 311             carnivora           felidae       leopardus
## 312             carnivora           felidae     leptailurus
## 313             carnivora           felidae            lynx
## 314             carnivora           felidae            lynx
## 315             carnivora           felidae            lynx
## 316             carnivora           felidae            lynx
## 317             carnivora           felidae       oncifelis
## 318             carnivora           felidae        panthera
## 319             carnivora           felidae        panthera
## 320             carnivora           felidae        panthera
## 321             carnivora           felidae    prionailurus
## 322             carnivora           felidae            puma
## 323             carnivora           felidae           uncia
## 324             carnivora       herpestidae          atilax
## 325             carnivora       herpestidae        cynictis
## 326             carnivora       herpestidae        helogale
## 327             carnivora       herpestidae       herpestes
## 328             carnivora       herpestidae       ichneumia
## 329             carnivora          hyanidae        proteles
## 330             carnivora        mustelidae            eira
## 331             carnivora        mustelidae        galictis
## 332             carnivora        mustelidae            gulo
## 333             carnivora        mustelidae          martes
## 334             carnivora        mustelidae          martes
## 335             carnivora        mustelidae          martes
## 336             carnivora        mustelidae          martes
## 337             carnivora        mustelidae         mustela
## 338             carnivora        mustelidae         mustela
## 339             carnivora        mustelidae         mustela
## 340             carnivora        mustelidae         mustela
## 341             carnivora        mustelidae         mustela
## 342             carnivora        mustelidae         mustela
## 343             carnivora        mustelidae         mustela
## 344             carnivora        mustelidae         taxidea
## 345             carnivora       procyonidae           potos
## 346             carnivora           ursidae      ailuropoda
## 347             carnivora           ursidae        melursus
## 348             carnivora        viverridae         genetta
## 349             carnivora        viverridae         genetta
## 350             carnivora        viverridae         viverra
## 351         dasyuromorpha        dasyuridae        dasyurus
## 352         dasyuromorpha        dasyuridae        dasyurus
## 353         dasyuromorpha        dasyuridae     sminthopsis
## 354         dasyuromorpia        dasyuridae      antechinus
## 355       didelphimorphia       didelphidae     monodelphis
## 356       didelphimorphia       didelphidae        thylamys
## 357           diprodontia      macropodidae     dendrolagus
## 358           diprodontia      macropodidae        macropus
## 359           diprodontia      macropodidae        macropus
## 360           diprodontia      macropodidae        macropus
## 361           diprodontia      macropodidae        macropus
## 362           diprodontia      macropodidae        macropus
## 363           diprodontia      macropodidae        macropus
## 364           diprodontia      macropodidae        macropus
## 365           diprodontia      macropodidae       petrogale
## 366           diprodontia        potoroidae       bettongia
## 367           diprodontia        potoroidae        potorous
## 368           diprodontia   pseudocheiridae     petauroides
## 369         diprotodontia      macropodidae     onychogalea
## 370         diprotodontia      macropodidae       thylogale
## 371         diprotodontia      macropodidae       thylogale
## 372         diprotodontia      macropodidae        wallabia
## 373         diprotodontia     phalangeridae     trichosurus
## 374         diprotodontia        vombatidae     lasiorhinus
## 375         diprotodontia        vombatidae        vombatus
## 376        erinaceomorpha       erinaceidae       erinaceus
## 377        erinaceomorpha       erinaceidae     hemiechinus
## 378            lagomorpha         leporidae     brachylagus
## 379            lagomorpha         leporidae           lepus
## 380            lagomorpha         leporidae           lepus
## 381            lagomorpha         leporidae           lepus
## 382            lagomorpha         leporidae           lepus
## 383            lagomorpha         leporidae           lepus
## 384            lagomorpha         leporidae           lepus
## 385            lagomorpha         leporidae           lepus
## 386            lagomorpha         leporidae     oryctolagus
## 387            lagomorpha         leporidae      sylvilagus
## 388            lagomorpha         leporidae      sylvilagus
## 389            lagomorpha         leporidae      sylvilagus
## 390            lagomorpha       ochotonidae        ochotona
## 391            lagomorpha       ochotonidae        ochotona
## 392         macroscelidea   macroscelididae    elephantulus
## 393         macroscelidea   macroscelididae     petrodromus
## 394         macroscelidea   macroscelididae     rhynchocyon
## 395          monotrematae    tachyglossidae    tachyoryctes
## 396       peramelemorphia       peramelidae         isoodon
## 397       peramelemorphia       peramelidae         isoodon
## 398        perissodactyla           equidae           equus
## 399        perissodactyla    rhinocerotidae   ceratotherium
## 400        perissodactyla    rhinocerotidae         diceros
## 401                pilosa      bradypodidae        bradypus
## 402           proboscidea      elephantidae         elephas
## 403           proboscidea      elephantidae       loxodonta
## 404                 roden        cricetidae       onychomys
## 405              rodentia     aplodontiidae      aplodontia
## 406              rodentia      bathyergidae      bathyergus
## 407              rodentia      bathyergidae       cryptomys
## 408              rodentia      bathyergidae       cryptomys
## 409              rodentia      bathyergidae       georychus
## 410              rodentia      bathyergidae    heliophobius
## 411              rodentia      bathyergidae  heterocephalus
## 412              rodentia          caviidae      dolichotus
## 413              rodentia     chinchillidae      lagostomus
## 414              rodentia        cricetidae   clethrionomys
## 415              rodentia        cricetidae       hylaeamys
## 416              rodentia        cricetidae          lemmus
## 417              rodentia        cricetidae        microtus
## 418              rodentia        cricetidae        microtus
## 419              rodentia        cricetidae        microtus
## 420              rodentia        cricetidae        microtus
## 421              rodentia        cricetidae        microtus
## 422              rodentia        cricetidae        microtus
## 423              rodentia        cricetidae        microtus
## 424              rodentia        cricetidae          myopus
## 425              rodentia        cricetidae         neotoma
## 426              rodentia        cricetidae         neotoma
## 427              rodentia        cricetidae         neotoma
## 428              rodentia        cricetidae         neotoma
## 429              rodentia        cricetidae         ondatra
## 430              rodentia        cricetidae      peromyscus
## 431              rodentia        cricetidae reithrodontomys
## 432              rodentia        cricetidae      synaptomys
## 433              rodentia         dipodidae      pygeretmus
## 434              rodentia        echimyidae      proechimys
## 435              rodentia        echimyidae      proechimys
## 436              rodentia    erethizontidae         coendou
## 437              rodentia    erethizontidae       erethizon
## 438              rodentia         geomyidae        thomomys
## 439              rodentia          gliridae      graphiurus
## 440              rodentia          gliridae     muscardinus
## 441              rodentia      heteromyidae       dipodomys
## 442              rodentia      heteromyidae       dipodomys
## 443              rodentia      heteromyidae       dipodomys
## 444              rodentia      heteromyidae       dipodomys
## 445              rodentia      heteromyidae       dipodomys
## 446              rodentia       hystricidae         hystrix
## 447              rodentia       hystricidae         hystrix
## 448              rodentia       hystridicae       atherurus
## 449              rodentia           muridae        apodemus
## 450              rodentia           muridae        apodemus
## 451              rodentia           muridae        meriones
## 452              rodentia           muridae       pseudomys
## 453              rodentia        nesomyidae      hypogeomys
## 454              rodentia        nesomyidae         nesomys
## 455              rodentia        nesomyidae         nesomys
## 456              rodentia      octodontidae      spalacopus
## 457              rodentia         sciuridae        eutamias
## 458              rodentia         sciuridae      funambulus
## 459              rodentia         sciuridae       glaucomys
## 460              rodentia         sciuridae       glaucomys
## 461              rodentia         sciuridae         marmota
## 462              rodentia         sciuridae         marmota
## 463              rodentia         sciuridae       paraxerus
## 464              rodentia         sciuridae         sciurus
## 465              rodentia         sciuridae         sciurus
## 466              rodentia         sciuridae         sciurus
## 467              rodentia         sciuridae         sciurus
## 468              rodentia         sciuridae         sciurus
## 469              rodentia         sciuridae    spermophilus
## 470              rodentia         sciuridae    spermophilus
## 471              rodentia         sciuridae    spermophilus
## 472              rodentia         sciuridae    spermophilus
## 473              rodentia         sciuridae    spermophilus
## 474              rodentia         sciuridae    spermophilus
## 475              rodentia         sciuridae    spermophilus
## 476              rodentia         sciuridae          tamias
## 477              rodentia         sciuridae          tamias
## 478              rodentia         sciuridae          tamias
## 479              rodentia         sciuridae          tamias
## 480              rodentia         sciuridae    tamiasciurus
## 481              rodentia         sciuridae           xerus
## 482          soricomorpha         soricidae       crocidura
## 483          soricomorpha         soricidae           sorex
## 484          soricomorpha         soricidae           sorex
## 485          soricomorpha         soricidae           sorex
## 486          soricomorpha         soricidae           sorex
## 487          soricomorpha         soricidae           sorex
## 488          soricomorpha          talpidae       condylura
## 489          soricomorpha          talpidae        scalopus
## 490          soricomorpha          talpidae           talpa
## 491          soricomorpha          talpidae           talpa
## 492              squamata          agamidae       uromastyx
## 493              squamata        colubridae       carphopis
## 494              squamata        colubridae       carphopis
## 495              squamata        colubridae         coluber
## 496              squamata        colubridae         coluber
## 497              squamata        colubridae       diadophis
## 498              squamata        colubridae      drymarchon
## 499              squamata        colubridae          elaphe
## 500              squamata        colubridae          elaphe
## 501              squamata        colubridae       heterodon
## 502              squamata        colubridae       hierophis
## 503              squamata        colubridae    lampropeltis
## 504              squamata        colubridae    lampropeltis
## 505              squamata        colubridae     masticophis
## 506              squamata        colubridae          natrix
## 507              squamata        colubridae         nerodia
## 508              squamata        colubridae         nerodia
## 509              squamata        colubridae      oocatochus
## 510              squamata        colubridae       pituophis
## 511              squamata        colubridae       pituophis
## 512              squamata        colubridae      thamnophis
## 513              squamata        colubridae      thamnophis
## 514              squamata        colubridae         zamenis
## 515              squamata          elapidae   hoplocephalus
## 516              squamata          elapidae        notechis
## 517              squamata          elapidae      pseudechis
## 518              squamata         iguanidae      conolophus
## 519              squamata         iguanidae         cyclura
## 520              squamata         iguanidae         cyclura
## 521              squamata         iguanidae         cyclura
## 522              squamata         iguanidae      sauromalus
## 523              squamata         iguanidae      sauromalus
## 524              squamata        lacertilia     dipsosaurus
## 525              squamata        lacertilia        gallotia
## 526              squamata       liolaemidae      phymaturus
## 527              squamata        pythonidae         morelia
## 528              squamata         scincidae         egernia
## 529              squamata         viperidae     agkistrodon
## 530              squamata         viperidae     agkistrodon
## 531              squamata         viperidae           bitis
## 532              squamata         viperidae        bothrops
## 533              squamata         viperidae        crotalus
## 534              squamata         viperidae        crotalus
## 535              squamata         viperidae        crotalus
## 536              squamata         viperidae        crotalus
## 537              squamata         viperidae        crotalus
## 538              squamata         viperidae        crotalus
## 539              squamata         viperidae        crotalus
## 540              squamata         viperidae        crotalus
## 541              squamata         viperidae        gloydius
## 542              squamata         viperidae     montivipera
## 543              squamata         viperidae          vipera
## 544            testudines          chelidae       chelodina
## 545            testudines          chelidae     mesoclemmys
## 546            testudines       chelydridae        chelydra
## 547            testudines          emydidae       chrysemys
## 548            testudines          emydidae     deirochelys
## 549            testudines          emydidae       emydoidea
## 550            testudines          emydidae            emys
## 551            testudines          emydidae       graptemys
## 552            testudines          emydidae       terrapene
## 553            testudines       geoemydidae        mauremys
## 554            testudines     kinosternidae     kinosternon
## 555            testudines     kinosternidae    sternotherus
## 556            testudines     kinosternidae    sternotherus
## 557            testudines      testudinidae      geochelone
## 558            testudines      testudinidae        gopherus
## 559            testudines      testudinidae        gopherus
## 560            testudines      testudinidae     indotestudo
## 561            testudines      testudinidae         kinixys
## 562            testudines      testudinidae        manouria
## 563            testudines      testudinidae     psammobates
## 564            testudines      testudinidae    stigmochelys
## 565            testudines      testudinidae         testudo
## 566            testudines      testudinidae         testudo
## 567            testudines      testudinidae         testudo
## 568            testudines      testudinidae         testudo
## 569            testudines      trionychidae         apalone
##                      species      primarymethod    N
## 1                   rostrata          telemetry   16
## 2                  poecilura     mark-recapture <NA>
## 3                   anomalum     mark-recapture   20
## 4                funduloides     mark-recapture   26
## 5                 cataractae     mark-recapture   17
## 6                masquinongy          telemetry    5
## 7                 pollachius          telemetry    2
## 8                     virens          telemetry    2
## 9                   lineatus direct observation <NA>
## 10                 lituratus          telemetry    8
## 11                 unicornis          telemetry    7
## 12                atlanticus direct observation   20
## 13                 ignobilis          telemetry    4
## 14                 rupestris     mark-recapture   16
## 15                  gibbosus          telemetry    4
## 16               macrochirus          telemetry    9
## 17                 megalotis     mark-recapture <NA>
## 18                  dolomieu          telemetry <NA>
## 19                 salmoides          telemetry    9
## 20                 annularis          telemetry   37
## 21                 baronessa direct observation <NA>
## 22                 trichrous direct observation   28
## 23              trifascialis direct observation <NA>
## 24              trifasciatus direct observation <NA>
## 25              unimaculatus direct observation <NA>
## 26              spectrabilis          telemetry    3
## 27                     pinos direct observation <NA>
## 28                     falco     mark-recapture   16
## 29                marmoratus     mark-recapture   27
## 30                  japonica direct observation   34
## 31                     dalli     mark-recapture   48
## 32                  hipoliti direct observation <NA>
## 33                 nicholsii     mark-recapture  104
## 34               longipinnis     mark-recapture   14
## 35                 sectatrix          telemetry   11
## 36                     rufus direct observation   47
## 37                 undulatus     mark-recapture    1
## 38                     julis     mark-recapture <NA>
## 39                bivittatus     mark-recapture    4
## 40                   garnoti     mark-recapture    2
## 41               maculipinna     mark-recapture    2
## 42                     poeyi     mark-recapture    2
## 43                dimidiatus direct observation <NA>
## 44                  bergylta          telemetry    2
## 45                lineolatus     mark-recapture   14
## 46                   pulcher          telemetry   16
## 47                 adspersus          telemetry    8
## 48               bifasciatum     mark-recapture    2
## 49                    lunare direct observation <NA>
## 50                     harak          telemetry   21
## 51                    analis          telemetry    4
## 52                    apodus          telemetry   15
## 53                decussatus          telemetry   58
## 54                   griseus          telemetry   14
## 55                 chrysurus          telemetry    5
## 56                  princeps          telemetry   17
## 57                    labrax          telemetry    2
## 58             flavolineatus          telemetry    4
## 59                porphyreus          telemetry   16
## 60                flavescens          telemetry    4
## 61                   luridus direct observation <NA>
## 62                      argi direct observation <NA>
## 63                   chromis direct observation <NA>
## 64                biocellata direct observation   18
## 65                   aruanus     mark-recapture <NA>
## 66                     wardi direct observation <NA>
## 67                  apicalis direct observation <NA>
## 68                  partitus direct observation <NA>
## 69                variabilis direct observation   10
## 70               microrhinos          telemetry    7
## 71                     iseri direct observation   25
## 72                 rivulatus          telemetry   18
## 73              aurofrenatum direct observation   25
## 74              chrysopterum direct observation   17
## 75                rubripinne direct observation   17
## 76                    viride direct observation   27
## 77                     argus     mark-recapture   16
## 78                 cruentata          telemetry   10
## 79               hemistiktos     mark-recapture    9
## 80                   miniata     mark-recapture   19
## 81                  guttatus     mark-recapture <NA>
## 82                marginatus          telemetry    7
## 83                     morio          telemetry   45
## 84                  striatus          telemetry   22
## 85                   tauvina          telemetry   14
## 86                    huntii direct observation    6
## 87               maccullochi     mark-recapture   13
## 88                    bonaci          telemetry    3
## 89                clathratus          telemetry   12
## 90                 nebulifer          telemetry    8
## 91                 areolatus          telemetry   15
## 92                 leopardus          telemetry   39
## 93                  cabrilla          telemetry   15
## 94                    scriba          telemetry   15
## 95                     salpa          telemetry <NA>
## 96                   auratus          telemetry <NA>
## 97                    clarki     mark-recapture   58
## 98                     gilae     mark-recapture  129
## 99                    mykiss     mark-recapture  125
## 100                    salar     mark-recapture  MCP
## 101                   trutta          telemetry <NA>
## 102                   bairdi     mark-recapture   51
## 103                carolinae     mark-recapture   32
## 104                    gobio     mark-recapture <NA>
## 105                 caurinus          telemetry    4
## 106                  inermis          telemetry    3
## 107                  maliger          telemetry    5
## 108                 melanops          telemetry   23
## 109                 mustinus          telemetry   10
## 110                  natalis     mark-recapture   27
## 111               guttulatus     mark-recapture <NA>
## 112           lumbriciformis direct observation <NA>
## 113                 rostrata     mark-recapture <NA>
## 114               chrysaetos         telemetry* <NA>
## 115                    buteo         telemetry* <NA>
## 116                 gallicus         telemetry* <NA>
## 117                fasciatus         telemetry* <NA>
## 118                 pennatus          telemetry    4
## 119             percnopterus         telemetry* <NA>
## 120                 strepera          telemetry    3
## 121                australis          telemetry    6
## 122                europaeus         telemetry* <NA>
## 123               ostralegus          telemetry    8
## 124                     inca direct observation <NA>
## 125                 palumbus         telemetry* <NA>
## 126                   turtur         telemetry* <NA>
## 127                 garrulus         telemetry* <NA>
## 128                    epops         telemetry* <NA>
## 129               glandarius         telemetry* <NA>
## 130                  canorus         telemetry* <NA>
## 131            californianus          telemetry    9
## 132               radiolosus          telemetry    1
## 133                 cooperii direct observation <NA>
## 134                 gentilis direct observation <NA>
## 135                    nisus         telemetry* <NA>
## 136                 striatus direct observation <NA>
## 137              jamaicensis direct observation <NA>
## 138                 lineatus direct observation <NA>
## 139                swainsoni direct observation <NA>
## 140                  cyaneus direct observation <NA>
## 141                 pygargus         telemetry* <NA>
## 142                   milvus         telemetry* <NA>
## 143                 cheriway          telemetry   26
## 144               americanus direct observation    6
## 145                biarmicus         telemetry* <NA>
## 146                mexicanus direct observation <NA>
## 147               peregrinus         telemetry* <NA>
## 148               sparverius direct observation <NA>
## 149              tinnunculus               <NA> <NA>
## 150                  bonasia         telemetry* <NA>
## 151             urophasianus          telemetry    5
## 152                 obscurus direct observation    3
## 153                  lagopus direct observation <NA>
## 154                   perdix         telemetry* <NA>
## 155                   tetrix         telemetry* <NA>
## 156                urogallus         telemetry* <NA>
## 157          cupido pinnatus          telemetry   71
## 158                    wolfi          telemetry    1
## 159                     crex          telemetry   20
## 160                  elegans          telemetry   18
## 161               polyglotta         telemetry* <NA>
## 162                 caudatus         telemetry* <NA>
## 163                  arborea direct observation <NA>
## 164               fuscicauda direct observation <NA>
## 165                   rubica direct observation <NA>
## 166               familiaris         telemetry* <NA>
## 167                 juncidis         telemetry* <NA>
## 168                    corax         telemetry* <NA>
## 169            caryocatactes direct observation <NA>
## 170                raimondii     mark-recapture    6
## 171               savannarum direct observation   54
## 172                   cyanea direct observation   10
## 173                   aberti direct observation <NA>
## 174                   fuscus direct observation   34
## 175                  arborea direct observation   30
## 176                passerina direct observation <NA>
## 177                cannabina         telemetry* <NA>
## 178                  coelebs         telemetry* <NA>
## 179                  serinus         telemetry* <NA>
## 180                    magna direct observation <NA>
## 181                 neglecta direct observation <NA>
## 182                   virens direct observation    8
## 183                 collurio direct observation <NA>
## 184             ludovicianus direct observation <NA>
## 185                    minor         telemetry* <NA>
## 186                  senator         telemetry* <NA>
## 187              polyglottos direct observation <NA>
## 188                     alba         telemetry* <NA>
## 189                    flava direct observation <NA>
## 190                  striata         telemetry* <NA>
## 191                 oenanthe direct observation <NA>
## 192              phoenicurus         telemetry* <NA>
## 193                  rubetra         telemetry* <NA>
## 194             atricapillus direct observation <NA>
## 195             carolinensis direct observation <NA>
## 196                inornatus direct observation <NA>
## 197                palustris direct observation <NA>
## 198             philadelphia direct observation <NA>
## 199                  trichas direct observation <NA>
## 200                   citrea direct observation <NA>
## 201             aurocapillus direct observation <NA>
## 202                    fusca direct observation <NA>
## 203                kirtlandi direct observation <NA>
## 204                 magnolia direct observation <NA>
## 205             pensylvanica direct observation <NA>
## 206                 petechia direct observation    8
## 207                ruticilla direct observation <NA>
## 208                   virens direct observation <NA>
## 209               canadensis direct observation <NA>
## 210                  bonelli         telemetry* <NA>
## 211             dentirostris          telemetry    4
## 212             ignicapillus         telemetry* <NA>
## 213                  regulus         telemetry* <NA>
## 214                 europaea         telemetry* <NA>
## 215                 fasciata direct observation <NA>
## 216                    sarda         telemetry* <NA>
## 217                   undata         telemetry* <NA>
## 218                 bewickiI direct observation <NA>
## 219             ludovicianus direct observation    6
## 220                    aedon direct observation <NA>
## 221              troglodytes direct observation <NA>
## 222                   sialis direct observation <NA>
## 223                   virens direct observation <NA>
## 224                  minimus direct observation <NA>
## 225                 wrightii direct observation <NA>
## 226                 tyrannus direct observation <NA>
## 227             atricapillus direct observation <NA>
## 228                    belli direct observation <NA>
## 229                  griseus direct observation    2
## 230                olivaceus direct observation <NA>
## 231                stellaris          telemetry    8
## 232                   exilis          telemetry   33
## 233                  martius         telemetry* <NA>
## 234                torquilla         telemetry* <NA>
## 235                 leucotos         telemetry* <NA>
## 236                   medius         telemetry* <NA>
## 237              tridactylus         telemetry* <NA>
## 238                    canus         telemetry* <NA>
## 239                  viridis         telemetry* <NA>
## 240              habroptilus          telemetry   13
## 241                americana          telemetry   10
## 242                  pennata          telemetry    7
## 243                 funereus         telemetry* <NA>
## 244                     otus         telemetry* <NA>
## 245                   noctua         telemetry* <NA>
## 246                     bubo         telemetry* <NA>
## 247              virginianus direct observation <NA>
## 248               passerinum         telemetry* <NA>
## 249                scandiaca direct observation <NA>
## 250                    aluco direct observation   55
## 251                     alba         telemetry* <NA>
## 252                  camelus          telemetry    1
## 253                   ornata direct observation   14
## 254               trevelyani         telemetry* <NA>
## 255                   granti         telemetry* <NA>
## 256                americana         telemetry* <NA>
## 257                 melampus         telemetry* <NA>
## 258               buselaphus         telemetry* <NA>
## 259                   lervia         telemetry* <NA>
## 260                    bison         telemetry* <NA>
## 261                  bonasus         telemetry* <NA>
## 262                   hircus         telemetry* <NA>
## 263                pyrenaica         telemetry* <NA>
## 264               callipygus         telemetry* <NA>
## 265                 dorsalis         telemetry* <NA>
## 266                  gazella         telemetry* <NA>
## 267                guentheri         telemetry* <NA>
## 268               americanus         telemetry* <NA>
## 269                    ammon         telemetry* <NA>
## 270               canadensis         telemetry* <NA>
## 271               campestris         telemetry* <NA>
## 272                rupicapra         telemetry* <NA>
## 273                     oryx         telemetry* <NA>
## 274                 scriptus         telemetry* <NA>
## 275             strepsiceros         telemetry* <NA>
## 276                    alces         telemetry* <NA>
## 277                     axis         telemetry* <NA>
## 278                capreolus         telemetry* <NA>
## 279                  elaphus         telemetry* <NA>
## 280                   nippon         telemetry* <NA>
## 281                     dama         telemetry* <NA>
## 282                  reevesi         telemetry* <NA>
## 283                 hemionus         telemetry* <NA>
## 284              virginianus         telemetry* <NA>
## 285              bezoarticus         telemetry* <NA>
## 286                     puda         telemetry* <NA>
## 287                 tarandus         telemetry* <NA>
## 288           camelopardalis         telemetry* <NA>
## 289                johnstoni         telemetry* <NA>
## 290              aethiopicus         telemetry* <NA>
## 291                  wagneri         telemetry* <NA>
## 292                   tajacu         telemetry* <NA>
## 293                   pecari         telemetry* <NA>
## 294                aquaticus         telemetry* <NA>
## 295                  fulgens         telemetry* <NA>
## 296                  lagopus         telemetry* <NA>
## 297                 simensis         telemetry* <NA>
## 298                 culpaeus         telemetry* <NA>
## 299                  griseus         telemetry* <NA>
## 300                  macroti         telemetry* <NA>
## 301                 ruppelli         telemetry* <NA>
## 302                    velox         telemetry* <NA>
## 303                    telum         telemetry* <NA>
## 304                    ferox         telemetry* <NA>
## 305                  jubatus         telemetry* <NA>
## 306                  caracal         telemetry* <NA>
## 307                    catus         telemetry* <NA>
## 308               sylvestris         telemetry* <NA>
## 309             yagouaroundi         telemetry* <NA>
## 310                 pardalis         telemetry* <NA>
## 311                   wiedii         telemetry* <NA>
## 312                   serval         telemetry* <NA>
## 313               canadensis         telemetry* <NA>
## 314                     lynx         telemetry* <NA>
## 315                 pardinus         telemetry* <NA>
## 316                    rufus         telemetry* <NA>
## 317                geoffroyi         telemetry* <NA>
## 318                     onca         telemetry* <NA>
## 319                   pardus         telemetry* <NA>
## 320                   tigris         telemetry* <NA>
## 321              bengalensis         telemetry* <NA>
## 322                 concolor         telemetry* <NA>
## 323                    uncia         telemetry* <NA>
## 324              paludinosus         telemetry* <NA>
## 325              penicillata         telemetry* <NA>
## 326                  parvula                 \\ <NA>
## 327               inchneumon          telemetry   20
## 328                albicauda         telemetry* <NA>
## 329                cristatus         telemetry* <NA>
## 330                  barbata         telemetry* <NA>
## 331                  vittata         telemetry* <NA>
## 332                     gulo         telemetry* <NA>
## 333                americana         telemetry* <NA>
## 334                    foina         telemetry* <NA>
## 335                   martes         telemetry* <NA>
## 336                 pennanti         telemetry* <NA>
## 337                  erminea         telemetry* <NA>
## 338                  frenata         telemetry* <NA>
## 339                     furo         telemetry* <NA>
## 340                 lutreola         telemetry* <NA>
## 341                 nigripes         telemetry* <NA>
## 342                  nivalis         telemetry* <NA>
## 343                 sibirica         telemetry* <NA>
## 344                    taxus         telemetry* <NA>
## 345                   flavus         telemetry* <NA>
## 346              melanoleuca         telemetry* <NA>
## 347                  ursinus         telemetry* <NA>
## 348                  genetta         telemetry* <NA>
## 349                  tigrina         telemetry* <NA>
## 350                  zibetha         telemetry* <NA>
## 351                geoffroii         telemetry* <NA>
## 352                maculatus          telemetry   19
## 353                 leucopus         telemetry* <NA>
## 354                 stuartii         telemetry* <NA>
## 355                americana         telemetry* <NA>
## 356                  elegans         telemetry* <NA>
## 357                lumholtzi         telemetry* <NA>
## 358              antilopinus         telemetry* <NA>
## 359                 dorsalis         telemetry* <NA>
## 360              fuliginosus         telemetry* <NA>
## 361                giganteus         telemetry* <NA>
## 362                 robustus         telemetry* <NA>
## 363              rufogriseus         telemetry* <NA>
## 364                    rufus         telemetry* <NA>
## 365                assimilis         telemetry* <NA>
## 366                 gaimardi         telemetry* <NA>
## 367                 longipes         telemetry* <NA>
## 368                   volans         telemetry* <NA>
## 369                 fraenata         telemetry* <NA>
## 370               stigmatica         telemetry* <NA>
## 371                   thetis         telemetry* <NA>
## 372                  bicolor         telemetry* <NA>
## 373                vulpecula         telemetry* <NA>
## 374                 krefftii         telemetry* <NA>
## 375                  ursinus         telemetry* <NA>
## 376                europaeus         telemetry* <NA>
## 377                  auritus         telemetry* <NA>
## 378               idahoensis         telemetry* <NA>
## 379               americanus         telemetry* <NA>
## 380                 arcticus         telemetry* <NA>
## 381             californicus         telemetry* <NA>
## 382                 capensis         telemetry* <NA>
## 383                europaeus         telemetry* <NA>
## 384              nigricollis         telemetry* <NA>
## 385                  timidus         telemetry* <NA>
## 386                cuniculus         telemetry* <NA>
## 387                aquaticus         telemetry* <NA>
## 388               floridanus         telemetry* <NA>
## 389                palustris         telemetry* <NA>
## 390                curzoniae         telemetry* <NA>
## 391                 princeps         telemetry* <NA>
## 392                rufescens         telemetry* <NA>
## 393            tetradactylus         telemetry* <NA>
## 394              chrysopygus         telemetry* <NA>
## 395                splendens         telemetry* <NA>
## 396                  auratus         telemetry* <NA>
## 397                 obesulus         telemetry* <NA>
## 398                 caballus         telemetry* <NA>
## 399                    simum         telemetry* <NA>
## 400                 bicornis         telemetry* <NA>
## 401                torquatus         telemetry* <NA>
## 402                  maximus         telemetry* <NA>
## 403                 africana         telemetry* <NA>
## 404                 torridus         telemetry* <NA>
## 405                     rufa         telemetry* <NA>
## 406                  suillus         telemetry* <NA>
## 407               damarensis         telemetry* <NA>
## 408              hottentotus         telemetry* <NA>
## 409                 capensis         telemetry* <NA>
## 410         argenteocinereus         telemetry* <NA>
## 411                   glaber         telemetry* <NA>
## 412                patagonus         telemetry* <NA>
## 413                  maximus         telemetry* <NA>
## 414             californicus         telemetry* <NA>
## 415             megacephalus         telemetry* <NA>
## 416                sibiricus         telemetry* <NA>
## 417                 agrestis         telemetry* <NA>
## 418             californicus         telemetry* <NA>
## 419                 montanus         telemetry* <NA>
## 420              ochrogaster         telemetry* <NA>
## 421           pennsylvanicus         telemetry* <NA>
## 422                pinetorum         telemetry* <NA>
## 423              richardsoni         telemetry* <NA>
## 424             schisticolor         telemetry* <NA>
## 425                  cinerea         telemetry* <NA>
## 426                 fuscipes         telemetry* <NA>
## 427                   lepida         telemetry* <NA>
## 428                 micropus         telemetry* <NA>
## 429                zibethica         telemetry* <NA>
## 430               gossypinus         telemetry* <NA>
## 431              raviventris         telemetry* <NA>
## 432                  cooperi         telemetry* <NA>
## 433                  pumilio         telemetry* <NA>
## 434                  cuvieri         telemetry* <NA>
## 435             semispinosus         telemetry* <NA>
## 436              prehensilis         telemetry* <NA>
## 437                 dorsatum         telemetry* <NA>
## 438                   bottae         telemetry* <NA>
## 439                 ocularis         telemetry* <NA>
## 440             avellanarius         telemetry* <NA>
## 441                   ingens         telemetry* <NA>
## 442                 merriami         telemetry* <NA>
## 443                    ordii         telemetry* <NA>
## 444              spectabilis         telemetry* <NA>
## 445                stephensi         telemetry* <NA>
## 446         africaeaustralis         telemetry* <NA>
## 447                   indica         telemetry* <NA>
## 448                africanus         telemetry* <NA>
## 449              flavicollis         telemetry* <NA>
## 450               sylvaticus         telemetry* <NA>
## 451                hurrianae         telemetry* <NA>
## 452                   fuscus         telemetry* <NA>
## 453                 antimena         telemetry* <NA>
## 454                audeberti         telemetry* <NA>
## 455                    rufus         telemetry* <NA>
## 456                   cyanus         telemetry* <NA>
## 457                sibiricus         telemetry* <NA>
## 458                 pennanti         telemetry* <NA>
## 459                 sabrinus         telemetry* <NA>
## 460                   volans         telemetry* <NA>
## 461             flaviventris         telemetry* <NA>
## 462                    monax         telemetry* <NA>
## 463                palliatus         telemetry* <NA>
## 464                   aberti         telemetry* <NA>
## 465             carolinensis         telemetry* <NA>
## 466                      lis         telemetry* <NA>
## 467                    niger         telemetry* <NA>
## 468                 vulgaris          telemetry <NA>
## 469                 beecheyi         telemetry* <NA>
## 470              columbianus         telemetry* <NA>
## 471               franklinii         telemetry* <NA>
## 472                  parryii         telemetry* <NA>
## 473                spilosoma         telemetry* <NA>
## 474         tridecemlineatus         telemetry* <NA>
## 475               variegatus         telemetry* <NA>
## 476                  amoenus         telemetry* <NA>
## 477                  minimus         telemetry* <NA>
## 478           quadrivittatus         telemetry* <NA>
## 479                 umbrinus         telemetry* <NA>
## 480               hudsonicus         telemetry* <NA>
## 481               erythropus         telemetry* <NA>
## 482                  russula         telemetry* <NA>
## 483                 arcticus         telemetry* <NA>
## 484                 cinereus         telemetry* <NA>
## 485                coronatus         telemetry* <NA>
## 486              gracillimus         telemetry* <NA>
## 487             unguiculatus         telemetry* <NA>
## 488                 cristata         telemetry* <NA>
## 489                aquaticus         telemetry* <NA>
## 490                 europaea         telemetry* <NA>
## 491                   romana         telemetry* <NA>
## 492                aegyptius     mark-recapture   20
## 493                   vermis           radiotag    1
## 494                  viridis           radiotag   10
## 495              constrictor          telemetry   15
## 496 constrictor flaviventris          telemetry   12
## 497                punctatus     mark-recapture <NA>
## 498                  couperi          telemetry    1
## 499           guttata emoryi          telemetry   12
## 500                 obsoleta          telemetry   18
## 501              platirhinos          telemetry    8
## 502             viridiflavus          telemetry   32
## 503            getula getula          telemetry   12
## 504               triangulum          telemetry   10
## 505                flagellum          telemetry    4
## 506                   natrix          telemetry    4
## 507            erythrogaster          telemetry   15
## 508                 sipeodon          telemetry   13
## 509             rufodorsatus          telemetry   21
## 510                catenifer          telemetry    4
## 511             melanoleucus          telemetry   12
## 512                  butleri     mark-recapture    1
## 513                    gigal          telemetry   11
## 514              longissimus          telemetry   32
## 515              bungaroides          telemetry   24
## 516                 scutatus          telemetry    5
## 517             porphyriacus          telemetry   44
## 518                 pallidus     mark-recapture <NA>
## 519                  cyclura          telemetry   15
## 520                   lewisi          telemetry    5
## 521                  pinguis          telemetry    9
## 522                 hispidua     mark-recapture    6
## 523                   obesus     mark-recapture <NA>
## 524                 dorsalis     mark-recapture   51
## 525                  galloti     mark-recapture   10
## 526              flagellifer     mark-recapture   12
## 527        spilota imbricata          telemetry   33
## 528                    major          telemetry    7
## 529               contortrix          telemetry   18
## 530              piscivorous          telemetry   15
## 531               schneideri          telemetry   11
## 532                    asper          telemetry    6
## 533                    atrox          telemetry   14
## 534                 cerastes          telemetry   25
## 535                 horridus          telemetry    6
## 536                 molossus          telemetry    3
## 537        oreganus concolor          telemetry   21
## 538                   pricei          telemetry    5
## 539               scutulatus          telemetry   19
## 540                   tigris          telemetry    3
## 541              shedaoensis          telemetry   16
## 542                   raddei          telemetry   14
## 543                 latastei          telemetry    7
## 544              longicollis          telemetry   32
## 545                    dahli          telemetry    8
## 546               serpentina          telemetry    6
## 547          picta marginata          telemetry   18
## 548              reticularia          telemetry    7
## 549               blandingii          telemetry   10
## 550              orbicularis          telemetry    3
## 551            flavimaculata          telemetry    7
## 552                   ornata          telemetry   10
## 553                  leprosa          telemetry    6
## 554                rubrubrum          telemetry   10
## 555           minor peltifer          telemetry   14
## 556                 odoratus          telemetry   18
## 557               carbonaria          telemetry   13
## 558                agassizii          telemetry   29
## 559               polyphemus          telemetry   22
## 560             travancorica          telemetry    4
## 561                   spekii    thread-trailing    7
## 562                 impressa          telemetry   10
## 563                tentorius          telemetry    4
## 564                 pardalis          telemetry   14
## 565                   graeca          telemetry   10
## 566                 hermanii          telemetry   24
## 567               horsfieldi          telemetry   29
## 568               kleinmanni          telemetry    9
## 569                spinifera          telemetry   11
##                                                                                                                                                                                       alternative.mass.reference
## 1                                                                                                                                                                                                           <NA>
## 2                                                                                                                                                                                                           <NA>
## 3                                                                                                                                                                                                           <NA>
## 4                                                                                                                                                                                                           <NA>
## 5                                                                                                                                                                                                           <NA>
## 6                                                                                                                                                                                                           <NA>
## 7                                                                                                                                                                                                           <NA>
## 8                                                                                                                                                                                                           <NA>
## 9                                                                                                                                                                                                           <NA>
## 10                                                                                                                                                                                                          <NA>
## 11                                                                                                                                                                                                          <NA>
## 12                                                                                                                                                                                                          <NA>
## 13                                                                                                                                                                                                          <NA>
## 14                                                                                                                                                                                                          <NA>
## 15                                                                                                                                                                                                          <NA>
## 16                                                                                                                                                                                                          <NA>
## 17                                                                                                                                                                                                          <NA>
## 18                                                                                                                                                                                                          <NA>
## 19                                                                                                                                                                                                          <NA>
## 20                                                                                                                                                                                                          <NA>
## 21                                                                                                                                                                                                          <NA>
## 22                                                                                                                                                                                                          <NA>
## 23                                                                                                                                                                                                          <NA>
## 24                                                                                                                                                                                                          <NA>
## 25                                                                                                                                                                                                          <NA>
## 26                                                                                                                                                                                                          <NA>
## 27                                                                                                                                                                                                          <NA>
## 28                                                                                                                                                                                                          <NA>
## 29                                                                                                                                                                                                          <NA>
## 30                                                                                                                                                                                                          <NA>
## 31                                                                                                                                                                                                          <NA>
## 32                                                                                                                                                                                                          <NA>
## 33                                                                                                                                                                                                          <NA>
## 34                                                                                                                                                                                                          <NA>
## 35                                                                                                                                                                                                          <NA>
## 36                                                                                                                                                                                                          <NA>
## 37                                                                                                                                                                                                          <NA>
## 38                                                                                                                                                                                                          <NA>
## 39                                                                                                                                                                                                          <NA>
## 40                                                                                                                                                                                                          <NA>
## 41                                                                                                                                                                                                          <NA>
## 42                                                                                                                                                                                                          <NA>
## 43                                                                                                                                                                                                          <NA>
## 44                                                                                                                                                                                                          <NA>
## 45                                                                                                                                                                                                          <NA>
## 46                                                                                                                                                                                                          <NA>
## 47                                                                                                                                                                                                          <NA>
## 48                                                                                                                                                                                                          <NA>
## 49                                                                                                                                                                                                          <NA>
## 50                                                                                                                                                                                                          <NA>
## 51                                                                                                                                                                                                          <NA>
## 52                                                                                                                                                                                                          <NA>
## 53                                                                                                                                                                                                          <NA>
## 54                                                                                                                                                                                                          <NA>
## 55                                                                                                                                                                                                          <NA>
## 56                                                                                                                                                                                                          <NA>
## 57                                                                                                                                                                                                          <NA>
## 58                                                                                                                                                                                                          <NA>
## 59                                                                                                                                                                                                          <NA>
## 60                                                                                                                                                                                                          <NA>
## 61                                                                                                                                                                                                          <NA>
## 62                                                                                                                                                                                                          <NA>
## 63                                                                                                                                                                                                          <NA>
## 64                                                                                                                                                                                                          <NA>
## 65                                                                                                                                                                                                          <NA>
## 66                                                                                                                                                                                                          <NA>
## 67                                                                                                                                                                                                          <NA>
## 68                                                                                                                                                                                                          <NA>
## 69                                                                                                                                                                                                          <NA>
## 70                                                                                                                                                                                                          <NA>
## 71                                                                                                                                                                                                          <NA>
## 72                                                                                                                                                                                                          <NA>
## 73                                                                                                                                                                                                          <NA>
## 74                                                                                                                                                                                                          <NA>
## 75                                                                                                                                                                                                          <NA>
## 76                                                                                                                                                                                                          <NA>
## 77                                                                                                                                                                                                          <NA>
## 78                                                                                                                                                                                                          <NA>
## 79                                                                                                                                                                                                          <NA>
## 80                                                                                                                                                                                                          <NA>
## 81                                                                                                                                                                                                          <NA>
## 82                                                                                                                                                                                                          <NA>
## 83                                                                                                                                                                                                          <NA>
## 84                                                                                                                                                                                                          <NA>
## 85                                                                                                                                                                                                          <NA>
## 86                                                                                                                                                                                                          <NA>
## 87                                                                                                                                                                                                          <NA>
## 88                                                                                                                                                                                                          <NA>
## 89                                                                                                                                                                                                          <NA>
## 90                                                                                                                                                                                                          <NA>
## 91                                                                                                                                                                                                          <NA>
## 92                                                                                                                                                                                                          <NA>
## 93                                                                                                                                                                                                          <NA>
## 94                                                                                                                                                                                                          <NA>
## 95                                                                                                                                                                                                          <NA>
## 96                                                                                                                                                                                                          <NA>
## 97                                                                                                                                                                                                          <NA>
## 98                                                                                                                                                                                                          <NA>
## 99                                                                                                                                                                                                          <NA>
## 100                                                                                                                                                                                                         <NA>
## 101                                                                                                                                                                                                         <NA>
## 102                                                                                                                                                                                                         <NA>
## 103                                                                                                                                                                                                         <NA>
## 104                                                                                                                                                                                                         <NA>
## 105                                                                                                                                                                                                         <NA>
## 106                                                                                                                                                                                                         <NA>
## 107                                                                                                                                                                                                         <NA>
## 108                                                                                                                                                                                                         <NA>
## 109                                                                                                                                                                                                         <NA>
## 110                                                                                                                                                                                                         <NA>
## 111                                                                                                                                                                                                         <NA>
## 112                                                                                                                                                                                                         <NA>
## 113                                                                                                                                                                                                         <NA>
## 114                                                                                                                                                                                                         <NA>
## 115                                                                                                                                                                                                         <NA>
## 116                                                                                                                                                                                                         <NA>
## 117                                                                                                                                                                                                         <NA>
## 118                                                                                                                                                                                                         <NA>
## 119                                                                                                                                                                                                         <NA>
## 120                                                                                                                                                                                                         <NA>
## 121                                                                                                                                                                                                         <NA>
## 122                                                                                                                                                                                                         <NA>
## 123                                                                                                                                                                                                         <NA>
## 124                                                                                                                                                                                                         <NA>
## 125                                                                                                                                                                                                         <NA>
## 126                                                                                                                                                                                                         <NA>
## 127                                                                                                                                                                                                         <NA>
## 128                                                                                                                                                                                                         <NA>
## 129                                                                                                                                                                                                         <NA>
## 130                                                                                                                                                                                                         <NA>
## 131                                                                                                                                               Weight calculated from telemetry backpack (10g = 3% body mass)
## 132                                                                                                                                                                                                         <NA>
## 133                                                                                                                                                                                                         <NA>
## 134                                                                                                                                                                                                         <NA>
## 135                                                                                                                                                                                                         <NA>
## 136                                                                                                                                                                                                         <NA>
## 137                                                                                                                                                                                                         <NA>
## 138                                                                                                                                                                                                         <NA>
## 139                                                                                                                                                                                                         <NA>
## 140                                                                                                                                                                                                         <NA>
## 141                                                                                                                                                                                                         <NA>
## 142                                                                                                                                                                                                         <NA>
## 143                                                                                                                                                                                                         <NA>
## 144                                                                                                                                                                                                         <NA>
## 145                                                                                                                                                                                                         <NA>
## 146                                                                                                                                                                                                         <NA>
## 147                                                                                                                                                                                                         <NA>
## 148                                                                                                                                                                                                         <NA>
## 149                                                                                                                                                                                                         <NA>
## 150                                                                                                                                                                                                         <NA>
## 151                                                                                                                        Beck TDI, Brain CE. 1978. Weights of Colorado Sage Grouse. The Condor 80(2), 241-243.
## 152                                                                                                                                                                                                         <NA>
## 153                                                                                                                                                                                                         <NA>
## 154                                                                                                                                                                                                         <NA>
## 155                                                                                                                                                                                                         <NA>
## 156                                                                                                                                                                                                         <NA>
## 157                                                                                                                                                                                                         <NA>
## 158                                                                                                                                                                                                         <NA>
## 159                                       Keiss O, Granats J, Mednis A. 2004. Use of biometrical data to study Corncrake Crex crex population in Latvia. Acta Universitatis Latviensis, Biology 676, 119\x96126.
## 160                                                                                                                                                                                                         <NA>
## 161                                                                                                                                                                                                         <NA>
## 162                                                                                                                                                                                                         <NA>
## 163                                                                                                                                                                                                         <NA>
## 164                                                                                                                                                                                                         <NA>
## 165                                                                                                                                                                                                         <NA>
## 166                                                                                                                                                                                                         <NA>
## 167                                                                                                                                                                                                         <NA>
## 168                                                                                                                                                                                                         <NA>
## 169                                                                                                                                                                                                         <NA>
## 170 Sabat P, Ramirez-Otatola , Barcelo G, Salinas J, Bozinovic F. Comparative basal metabolic rate among passerines and the food habit hypothesis. Comparative Biochemistry and Physiology Part A 157, 35\x9640.
## 171                                                                                                                                                                                                         <NA>
## 172                                                                                                                                                                                                         <NA>
## 173                                                                                                                                                                                                         <NA>
## 174                                                                                                                                                                                                         <NA>
## 175                                                                                                                                                                                                         <NA>
## 176                                                                                                                                                                                                         <NA>
## 177                                                                                                                                                                                                         <NA>
## 178                                                                                                                                                                                                         <NA>
## 179                                                                                                                                                                                                         <NA>
## 180                                                                                                                                                                                                         <NA>
## 181                                                                                                                                                                                                         <NA>
## 182                                                                                                                                                                                                         <NA>
## 183                                                                                                                                                                                                         <NA>
## 184                                                                                                                                                                                                         <NA>
## 185                                                                                                                                                                                                         <NA>
## 186                                                                                                                                                                                                         <NA>
## 187                                                                                                                                                                                                         <NA>
## 188                                                                                                                                                                                                         <NA>
## 189                                                                                                                                                                                                         <NA>
## 190                                                                                                                                                                                                         <NA>
## 191                                                                                                                                                                                                         <NA>
## 192                                                                                                                                                                                                         <NA>
## 193                                                                                                                                                                                                         <NA>
## 194                                                                                                                                                                                                         <NA>
## 195                                                                                                                                                                                                         <NA>
## 196                                                                                                                                                                                                         <NA>
## 197                                                                                                                                                                                                         <NA>
## 198                                                                                                                                                                                                         <NA>
## 199                                                                                                                                                                                                         <NA>
## 200                                                                                                                                                                                                         <NA>
## 201                                                                                                                                                                                                         <NA>
## 202                                                                                                                                                                                                         <NA>
## 203                                                                                                                                                                                                         <NA>
## 204                                                                                                                                                                                                         <NA>
## 205                                                                                                                                                                                                         <NA>
## 206                                                                                                                                                                                                         <NA>
## 207                                                                                                                                                                                                         <NA>
## 208                                                                                                                                                                                                         <NA>
## 209                                                                                                                                                                                                         <NA>
## 210                                                                                                                                                                                                         <NA>
## 211                                                    Frith CB, Frith DW. 2001. Morphology, Moult and Survival in Three Sympatric Bowerbirds in Australian Wet Tropics Upland Rainforest. Corella 25(3): 41-60.
## 212                                                                                                                                                                                                         <NA>
## 213                                                                                                                                                                                                         <NA>
## 214                                                                                                                                                                                                         <NA>
## 215                                                                                                                                                                                                         <NA>
## 216                                                                                                                                                                                                         <NA>
## 217                                                                                                                                                                                                         <NA>
## 218                                                                                                                                                                                                         <NA>
## 219                                                                                                                                                                                                         <NA>
## 220                                                                                                                                                                                                         <NA>
## 221                                                                                                                                                                                                         <NA>
## 222                                                                                                                                                                                                         <NA>
## 223                                                                                                                                                                                                         <NA>
## 224                                                                                                                                                                                                         <NA>
## 225                                                                                                                                                                                                         <NA>
## 226                                                                                                                                                                                                         <NA>
## 227                                                                                                                                                                                                         <NA>
## 228                                                                                                                                                                                                         <NA>
## 229                                                                                                                                                                                                         <NA>
## 230                                                                                                                                                                                                         <NA>
## 231                                                                                                                                                                                                         <NA>
## 232                                                                                                                                                                                                         <NA>
## 233                                                                                                                                                                                                         <NA>
## 234                                                                                                                                                                                                         <NA>
## 235                                                                                                                                                                                                         <NA>
## 236                                                                                                                                                                                                         <NA>
## 237                                                                                                                                                                                                         <NA>
## 238                                                                                                                                                                                                         <NA>
## 239                                                                                                                                                                                                         <NA>
## 240                                                                                                                                                                                                         <NA>
## 241                                            Forsyth DM, Wilmhurst JM, Allen RB, Coomes DA. Impacts of introduced deer and extinct moa on New Zealand ecosystems. New Zealand Journal of Ecology 34(1), 48-65.
## 242                                            Forsyth DM, Wilmhurst JM, Allen RB, Coomes DA. Impacts of introduced deer and extinct moa on New Zealand ecosystems. New Zealand Journal of Ecology 34(1), 48-65.
## 243                                                                                                                                                                                                         <NA>
## 244                                                                                                                                                                                                         <NA>
## 245                                                                                                                                                                                                         <NA>
## 246                                                                                                                                                                                                         <NA>
## 247                                                                                                                                                                                                         <NA>
## 248                                                                                                                                                                                                         <NA>
## 249                                                                                                                                                                                                         <NA>
## 250                                                                                                                                                                                                         <NA>
## 251                                                                                                                                                                                                         <NA>
## 252                                                                                                                                                                                                         <NA>
## 253                                                                                                                                                                                                         <NA>
## 254                                                                                                                                                                                                         <NA>
## 255                                                                                                                                                                                                         <NA>
## 256                                                                                                                                                                                                         <NA>
## 257                                                                                                                                                                                                         <NA>
## 258                                                                                                                                                                                                         <NA>
## 259                                                                                                                                                                                                         <NA>
## 260                                                                                                                                                                                                         <NA>
## 261                                                                                                                                                                                                         <NA>
## 262                                                                                                                                                                                                         <NA>
## 263                                                                                                                                                                                                         <NA>
## 264                                                                                                                                                                                                         <NA>
## 265                                                                                                                                                                                                         <NA>
## 266                                                                                                                                                                                                         <NA>
## 267                                                                                                                                                                                                         <NA>
## 268                                                                                                                                                                                                         <NA>
## 269                                                                                                                                                                                                         <NA>
## 270                                                                                                                                                                                                         <NA>
## 271                                                                                                                                                                                                         <NA>
## 272                                                                                                                                                                                                         <NA>
## 273                                                                                                                                                                                                         <NA>
## 274                                                                                                                                                                                                         <NA>
## 275                                                                                                                                                                                                         <NA>
## 276                                                                                                                                                                                                         <NA>
## 277                                                                                                                                                                                                         <NA>
## 278                                                                                                                                                                                                         <NA>
## 279                                                                                                                                                                                                         <NA>
## 280                                                                                                                                                                                                         <NA>
## 281                                                                                                                                                                                                         <NA>
## 282                                                                                                                                                                                                         <NA>
## 283                                                                                                                                                                                                         <NA>
## 284                                                                                                                                                                                                         <NA>
## 285                                                                                                                                                                                                         <NA>
## 286                                                                                                                                                                                                         <NA>
## 287                                                                                                                                                                                                         <NA>
## 288                                                                                                                                                                                                         <NA>
## 289                                                                                                                                                                                                         <NA>
## 290                                                                                                                                                                                                         <NA>
## 291                                                                                                                                                                                                         <NA>
## 292                                                                                                                                                                                                         <NA>
## 293                                                                                                                                                                                                         <NA>
## 294                                                                                                                                                                                                         <NA>
## 295                                                                                                                                                                                                         <NA>
## 296                                                                                                                                                                                                         <NA>
## 297                                                                                                                                                                                                         <NA>
## 298                                                                                                                                                                                                         <NA>
## 299                                                                                                                                                                                                         <NA>
## 300                                                                                                                                                                                                         <NA>
## 301                                                                                                                                                                                                         <NA>
## 302                                                                                                                                                                                                         <NA>
## 303                                                                                                                                                                                                         <NA>
## 304                                                                                                                                                                                                         <NA>
## 305                                                                                                                                                                                                         <NA>
## 306                                                                                                                                                                                                         <NA>
## 307                                                                                                                                                                                                         <NA>
## 308                                                                                                                                                                                                         <NA>
## 309                                                                                                                                                                                                         <NA>
## 310                                                                                                                                                                                                         <NA>
## 311                                                                                                                                                                                                         <NA>
## 312                                                                                                                                                                                                         <NA>
## 313                                                                                                                                                                                                         <NA>
## 314                                                                                                                                                                                                         <NA>
## 315                                                                                                                                                                                                         <NA>
## 316                                                                                                                                                                                                         <NA>
## 317                                                                                                                                                                                                         <NA>
## 318                                                                                                                                                                                                         <NA>
## 319                                                                                                                                                                                                         <NA>
## 320                                                                                                                                                                                                         <NA>
## 321                                                                                                                                                                                                         <NA>
## 322                                                                                                                                                                                                         <NA>
## 323                                                                                                                                                                                                         <NA>
## 324                                                                                                                                                                                                         <NA>
## 325                                                                                                                                                                                                         <NA>
## 326                                                                                                                                                                                                         <NA>
## 327                                                                                                                                                                                                         <NA>
## 328                                                                                                                                                                                                         <NA>
## 329                                                                                                                                                                                                         <NA>
## 330                                                                                                                                                                                                         <NA>
## 331                                                                                                                                                                                                         <NA>
## 332                                                                                                                                                                                                         <NA>
## 333                                                                                                                                                                                                         <NA>
## 334                                                                                                                                                                                                         <NA>
## 335                                                                                                                                                                                                         <NA>
## 336                                                                                                                                                                                                         <NA>
## 337                                                                                                                                                                                                         <NA>
## 338                                                                                                                                                                                                         <NA>
## 339                                                                                                                                                                                                         <NA>
## 340                                                                                                                                                                                                         <NA>
## 341                                                                                                                                                                                                         <NA>
## 342                                                                                                                                                                                                         <NA>
## 343                                                                                                                                                                                                         <NA>
## 344                                                                                                                                                                                                         <NA>
## 345                                                                                                                                                                                                         <NA>
## 346                                                                                                                                                                                                         <NA>
## 347                                                                                                                                                                                                         <NA>
## 348                                                                                                                                                                                                         <NA>
## 349                                                                                                                                                                                                         <NA>
## 350                                                                                                                                                                                                         <NA>
## 351                                                                                                                                                                                                         <NA>
## 352                                                                                                                                                                                                         <NA>
## 353                                                                                                                                                                                                         <NA>
## 354                                                                                                                                                                                                         <NA>
## 355                                                                                                                                                                                                         <NA>
## 356                                                                                                                                                                                                         <NA>
## 357                                                                                                                                                                                                         <NA>
## 358                                                                                                                                                                                                         <NA>
## 359                                                                                                                                                                                                         <NA>
## 360                                                                                                                                                                                                         <NA>
## 361                                                                                                                                                                                                         <NA>
## 362                                                                                                                                                                                                         <NA>
## 363                                                                                                                                                                                                         <NA>
## 364                                                                                                                                                                                                         <NA>
## 365                                                                                                                                                                                                         <NA>
## 366                                                                                                                                                                                                         <NA>
## 367                                                                                                                                                                                                         <NA>
## 368                                                                                                                                                                                                         <NA>
## 369                                                                                                                                                                                                         <NA>
## 370                                                                                                                                                                                                         <NA>
## 371                                                                                                                                                                                                         <NA>
## 372                                                                                                                                                                                                         <NA>
## 373                                                                                                                                                                                                         <NA>
## 374                                                                                                                                                                                                         <NA>
## 375                                                                                                                                                                                                         <NA>
## 376                                                                                                                                                                                                         <NA>
## 377                                                                                                                                                                                                         <NA>
## 378                                                                                                                                                                                                         <NA>
## 379                                                                                                                                                                                                         <NA>
## 380                                                                                                                                                                                                         <NA>
## 381                                                                                                                                                                                                         <NA>
## 382                                                                                                                                                                                                         <NA>
## 383                                                                                                                                                                                                         <NA>
## 384                                                                                                                                                                                                         <NA>
## 385                                                                                                                                                                                                         <NA>
## 386                                                                                                                                                                                                         <NA>
## 387                                                                                                                                                                                                         <NA>
## 388                                                                                                                                                                                                         <NA>
## 389                                                                                                                                                                                                         <NA>
## 390                                                                                                                                                                                                         <NA>
## 391                                                                                                                                                                                                         <NA>
## 392                                                                                                                                                                                                         <NA>
## 393                                                                                                                                                                                                         <NA>
## 394                                                                                                                                                                                                         <NA>
## 395                                                                                                                                                                                                         <NA>
## 396                                                                                                                                                                                                         <NA>
## 397                                                                                                                                                                                                         <NA>
## 398                                                                                                                                                                                                         <NA>
## 399                                                                                                                                                                                                         <NA>
## 400                                                                                                                                                                                                         <NA>
## 401                                                                                                                                                                                                         <NA>
## 402                                                                                                                                                                                                         <NA>
## 403                                                                                                                                                                                                         <NA>
## 404                                                                                                                                                                                                         <NA>
## 405                                                                                                                                                                                                         <NA>
## 406                                                                                                                                                                                                         <NA>
## 407                                                                                                                                                                                                         <NA>
## 408                                                                                                                                                                                                         <NA>
## 409                                                                                                                                                                                                         <NA>
## 410                                                                                                                                                                                                         <NA>
## 411                                                                                                                                                                                                         <NA>
## 412                                                                                                                                                                                                         <NA>
## 413                                                                                                                                                                                                         <NA>
## 414                                                                                                                                                                                                         <NA>
## 415                                                                                                                                                                                                         <NA>
## 416                                                                                                                                                                                                         <NA>
## 417                                                                                                                                                                                                         <NA>
## 418                                                                                                                                                                                                         <NA>
## 419                                                                                                                                                                                                         <NA>
## 420                                                                                                                                                                                                         <NA>
## 421                                                                                                                                                                                                         <NA>
## 422                                                                                                                                                                                                         <NA>
## 423                                                                                                                                                                                                         <NA>
## 424                                                                                                                                                                                                         <NA>
## 425                                                                                                                                                                                                         <NA>
## 426                                                                                                                                                                                                         <NA>
## 427                                                                                                                                                                                                         <NA>
## 428                                                                                                                                                                                                         <NA>
## 429                                                                                                                                                                                                         <NA>
## 430                                                                                                                                                                                                         <NA>
## 431                                                                                                                                                                                                         <NA>
## 432                                                                                                                                                                                                         <NA>
## 433                                                                                                                                                                                                         <NA>
## 434                                                                                                                                                                                                         <NA>
## 435                                                                                                                                                                                                         <NA>
## 436                                                                                                                                                                                                         <NA>
## 437                                                                                                                                                                                                         <NA>
## 438                                                                                                                                                                                                         <NA>
## 439                                                                                                                                                                                                         <NA>
## 440                                                                                                                                                                                                         <NA>
## 441                                                                                                                                                                                                         <NA>
## 442                                                                                                                                                                                                         <NA>
## 443                                                                                                                                                                                                         <NA>
## 444                                                                                                                                                                                                         <NA>
## 445                                                                                                                                                                                                         <NA>
## 446                                                                                                                                                                                                         <NA>
## 447                                                                                                                                                                                                         <NA>
## 448                                                                                                                                                                                                         <NA>
## 449                                                                                                                                                                                                         <NA>
## 450                                                                                                                                                                                                         <NA>
## 451                                                                                                                                                                                                         <NA>
## 452                                                                                                                                                                                                         <NA>
## 453                                                                                                                                                                                                         <NA>
## 454                                                                                                                                                                                                         <NA>
## 455                                                                                                                                                                                                         <NA>
## 456                                                                                                                                                                                                         <NA>
## 457                                                                                                                                                                                                         <NA>
## 458                                                                                                                                                                                                         <NA>
## 459                                                                                                                                                                                                         <NA>
## 460                                                                                                                                                                                                         <NA>
## 461                                                                                                                                                                                                         <NA>
## 462                                                                                                                                                                                                         <NA>
## 463                                                                                                                                                                                                         <NA>
## 464                                                                                                                                                                                                         <NA>
## 465                                                                                                                                                                                                         <NA>
## 466                                                                                                                                                                                                         <NA>
## 467                                                                                                                                                                                                         <NA>
## 468                                                                                                                                                                                                         <NA>
## 469                                                                                                                                                                                                         <NA>
## 470                                                                                                                                                                                                         <NA>
## 471                                                                                                                                                                                                         <NA>
## 472                                                                                                                                                                                                         <NA>
## 473                                                                                                                                                                                                         <NA>
## 474                                                                                                                                                                                                         <NA>
## 475                                                                                                                                                                                                         <NA>
## 476                                                                                                                                                                                                         <NA>
## 477                                                                                                                                                                                                         <NA>
## 478                                                                                                                                                                                                         <NA>
## 479                                                                                                                                                                                                         <NA>
## 480                                                                                                                                                                                                         <NA>
## 481                                                                                                                                                                                                         <NA>
## 482                                                                                                                                                                                                         <NA>
## 483                                                                                                                                                                                                         <NA>
## 484                                                                                                                                                                                                         <NA>
## 485                                                                                                                                                                                                         <NA>
## 486                                                                                                                                                                                                         <NA>
## 487                                                                                                                                                                                                         <NA>
## 488                                                                                                                                                                                                         <NA>
## 489                                                                                                                                                                                                         <NA>
## 490                                                                                                                                                                                                         <NA>
## 491                                                                                                                                                                                                         <NA>
## 492                                                                                                                                                                                                         <NA>
## 493                                                                                                                                                                                                         <NA>
## 494                                                                                                                                                                                                         <NA>
## 495                                                                                                                                                                                                         <NA>
## 496                                                                                                                                                                                                         <NA>
## 497                                                                                                                                                                                                         <NA>
## 498                                                                                                                                                                                                         <NA>
## 499                                                                                                                                                                                                         <NA>
## 500                                                                                                                                                                                                         <NA>
## 501                                                                                                                                                                                                         <NA>
## 502                                                                                                                                                                                                         <NA>
## 503                                                                                                                                                                                                         <NA>
## 504                                                                                                                                                                                                         <NA>
## 505                                                                                                                                                                                                         <NA>
## 506                                                                                                                                                                                                         <NA>
## 507                                                                                                                                                                                                         <NA>
## 508                                                                                                                                                                                                         <NA>
## 509                                                                                                                                                                                                         <NA>
## 510                                                                                                                                                                                                         <NA>
## 511                                                                                                                                                                                                         <NA>
## 512                                                                                                                                                                                                         <NA>
## 513                                                                                                                                                                                                         <NA>
## 514                                                                                                                                                                                                         <NA>
## 515                                                                                                                                                                                                         <NA>
## 516                                                                                                                                                                                                         <NA>
## 517                                                                                                                                                                                                         <NA>
## 518                                                                                                                                                                                                         <NA>
## 519                                                                                                                                                                                                         <NA>
## 520                                                                                                                                                                                                         <NA>
## 521                                                                                                                                                                                                         <NA>
## 522                                                                                                                                                                                                         <NA>
## 523                                                                                                                                                                                                         <NA>
## 524                                                                                                                                                                                                         <NA>
## 525                                                                                                                                                                                                         <NA>
## 526                                                                                                                                                                                                         <NA>
## 527                                                                                                                                                                                                         <NA>
## 528                                                                                                                                                                                                         <NA>
## 529                                                                                                                                                                                                         <NA>
## 530                                                                                                                                                                                                         <NA>
## 531                                                                                                                                                                                                         <NA>
## 532                                                                                                                                                                                                         <NA>
## 533                                                                                                                                                                                                         <NA>
## 534                                                                                                                                                                                                         <NA>
## 535                                                                                                                                                                                                         <NA>
## 536                                                                                                                                                                                                         <NA>
## 537                                                                                                                                                                                                         <NA>
## 538                                                                                                                                                                                                         <NA>
## 539                                                                                                                                                                                                         <NA>
## 540                                                                                                                                                                                                         <NA>
## 541                                                                                                                                                                                                         <NA>
## 542                                                                                                                                                                                                         <NA>
## 543                                                                                                                                                                                                         <NA>
## 544                                                                                                                                                                                                         <NA>
## 545                                                                                                                                                                                                         <NA>
## 546                                                                                                                                                                                                         <NA>
## 547                                                                            Snow JE. 1984. Feeding Ecology of Juvenile Turtles (Chrysemys) under experimental conditions. PhD Thesis, University of Oklahoma.
## 548                                                                                                                                                                                                         <NA>
## 549                                                                                                                                                                                                         <NA>
## 550                                                                                                                                                                                                         <NA>
## 551                                                                                                                                                                                                         <NA>
## 552                                                                                                                                                                                                         <NA>
## 553                                                                                                                                                                                                         <NA>
## 554                                                                                                                                                                                                         <NA>
## 555                                                                                                                                                                                                         <NA>
## 556                                                                                                                                                                                                         <NA>
## 557                                                                                                                                                                                                         <NA>
## 558                                                                                                                                                                                                         <NA>
## 559                                                                                                                                                                                                         <NA>
## 560                                                                                                                                                                                                         <NA>
## 561                                                                                                                                                                                                         <NA>
## 562                                                                                                                                                                                                         <NA>
## 563                                                                                                                                                                                                         <NA>
## 564                                                                                                                                                                                                         <NA>
## 565                                                                                                                                                                                                         <NA>
## 566                                                                                                                                                                                                         <NA>
## 567                                                                                                                                                                                                         <NA>
## 568                                                                                                                                                                                                         <NA>
## 569                                                                                                                                                                                                         <NA>
##                                                                                                                                                                                                                                                                                                                   hra.reference
## 1                                                                                                                                                                                    Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 2                                                                                                                                                                                    Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 3                                                                                                                                                                                    Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 4                                                                                                                                                                                    Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 5                                                                                                                                                                                    Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 6                                                                                                                                                                                    Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 7                                                                                                                                             Sarno B, Glass CW, Smith GW, et al. 1994. A comparison of the movements of two species of gadoid in the vicinity of an underwater reef. Journal of Fisheries Biology 45, 811-817.
## 8                                                                                                                                             Sarno B, Glass CW, Smith GW, et al. 1994. A comparison of the movements of two species of gadoid in the vicinity of an underwater reef. Journal of Fisheries Biology 45, 811-817.
## 9                                                                                                                                                                                  Nursall JR. 1974. Some Territorial Behavioral Attributes of the Surgeonfish Acanthurus lineatus at Heron Island, Queensland. Copeia 950-959.
## 10                                                                                                                        Marshell A, Mills JS, Rhodes KL, et al. 2011. Passive acoustic telemetry reveals highly variable home range and movement patterns among unicornfish within a marine reserve. Coral Reefs 30, 631-642.
## 11                                                                                                                        Marshell A, Mills JS, Rhodes KL, et al. 2011. Passive acoustic telemetry reveals highly variable home range and movement patterns among unicornfish within a marine reserve. Coral Reefs 30, 631-642.
## 12                                                                                                                                                                               Nursall JR. 1977. Territoriality in Redlip blennies (Ophioblennius atlanticus - Pisces : Blenniidae). Journal of Zoology, London 182, 205-223.
## 13                                                                                                                 Wetherbee BM, Holland KN, Meyer CG, et al. 2004. Use of a marine reserve in Kaneohe Bay, Hawaii by the giant trevally, Caranx ignobilis. Fisheries Research 67, 253-263. (doi:10.1016/j.fishres.2003.11.004)
## 14                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 15                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 16                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 17                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 18                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 19                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 20                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 21                                                                                                                                                                                                                              Reese ES. 1973. Duration of Residence by Coral Reef Fishes on "Home" Reefs. Copeia, 1, 145-149.
## 22                                                                                                                                                           Reavis RH, Copus JM. 2011. Monogamy in a feeding generalist, Chaetodon trichrous, the endemic Tahitian Butterflyfish. Environmental Biology of Fishes 92, 167-179.
## 23                                                                                                                                                                                                                              Reese ES. 1973. Duration of Residence by Coral Reef Fishes on "Home" Reefs. Copeia, 1, 145-149.
## 24                                                                                                                                                                                           Sutton M. 1985. Patterns of spacing in a coral reef fish in two habitats on the Great Barrier Reef. Animal Behavior 33, 1332-1337.
## 25                                                                                                                                                                                                                              Reese ES. 1973. Duration of Residence by Coral Reef Fishes on "Home" Reefs. Copeia, 1, 145-149.
## 26                                                                                                                                           Buxton CD, Semmens JM, Forbes E, et al. 2010. Spatial Management of Reef Fisheries And Ecosystems: Understanding The Importance of Movement. FRDC Final Report - Project 2004/002.
## 27                                                                                                                                                                                                       Luckhurst BE, Luckhurst K. 1978. Diurnal Space Utilization in Coral Reef Fish Communities. Marine Biology 49, 325-332.
## 28                                                                                                                                  Kadota T, Osato J, Hashimoto H, et al. 2011. Harem structure and female territoriality in the dwarf hawkfish Cirrhitichthys falco (Cirrhitidae). Environmental Biology of Fishes 92, 79-88.
## 29                                                                                                                      Mireles C, Nakamura R, Wendt DE. 2012. A collaborative approach to investigate site fidelity, home range, and homing behavior of cabezon (Scorpaenichthys marmoratus). Fisheries Research 113, 133-142.
## 30                                                                                                                                                                               Yanagisawa Y. 1982. Social Behaviour and Mating System of the Gobiid Fish Amblyeleotris japonica. Japanese Journal of Ichthyology 28: 401-422.
## 31                                                                                             St. Mary CM. 1994. Sex allocation in a simultaneous hermaphrodite, the blue-banded goby (Lythrypnus dalli): the effects of body size and behavioral gender and the consequences for reproduction. Behavioral Ecology 5, 304-313.
## 32                                                                                                                                                                                                       Luckhurst BE, Luckhurst K. 1978. Diurnal Space Utilization in Coral Reef Fish Communities. Marine Biology 49, 325-332.
## 33                                                                                                  Kroon FJ, de Graff M, Liley NR. 2000. Social organisation and competition for refuges and nest sites in Coryphopterus nicholsii (Gobiidae), a temperate protogynous reef fish. Environmental Biology of Fishes 57, 401-411.
## 34                                                                                                                                   Takegaki T. 2001. Environmental factors affecting the spawning burrow selection by the gobiid Valenciennea longipinnis. Journal of Fish Biology. 58, 222-229. (doi:10.1006/jfbi.2000.1438)
## 35                                                                                  Eristhee N, Oxenford HA. 2001. Home range size and use of space by Bermuda chub Kyphosus sectatrix (L.) in two marine reserves in the Soufri\xe8re Marine Management Area, St Lucia, West Indies. Journal of Fisheries Biology 59, 129-151.
## 36                                                                                                                                                                                               Hoffman SG. 1983. Sex-Related Foraging Behavior in Sequentially Hermaphroditic Hogfishes (Bodianus Spp.). Ecology 64, 798-808.
## 37                                                                                                                     Chateau O, Wantiez L. 2007. Site fidelity and activity patterns of a humphead wrasse, Cheilinus undulatus (Labridae), as determined by acoustic telemetry. Environmental Biology of Fishes 808, 503-508.
## 38                                                                                   Palmer M, Balle S, March D, et al. 2011. Size estimation of circular home range from fish mark-release-(single)-recapture data: case study of a small labrid targeted by recreational fishing. Marine Ecology Progress Series 430, 87-97. 
## 39                                                                                                                                                                             Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
## 40                                                                                                                                                                             Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
## 41                                                                                                                                                                             Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
## 42                                                                                                                                                                             Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
## 43                                                                                                                                  Robertson DR. 1974. A Study of the Ethology and Reproductive Biology of the Labrid Fish, Labroides dimidiatus, at Heron Island, Great Barrier Reef. Ph.D. thesis. University of Queensland.
## 44                                                                                                                                                             Pita P, Freire J. 2011. Movements of three large coastal predatory fishes in the northeast Atlantic: a preliminary telemetry study. Scientia Marina 75, 759-770.
## 45                                                Kingsford MJ, Carlson IJ. 2010. Patterns of distribution and movement of fishes, Ophthalmolepis lineolatus and Hypoplectrodes maccullochi, on temperate rocky reefs of south eastern Australia. Environmental Biology of Fishes 88, 105-118. (doi: 10.1007/s10641-010-9621-1)
## 46                                                                                                               Topping DT, Lowe CG, Caselle JE. 2005. Home range and habitat utilization of adult California sheephead, Semicossyphus pulcher (Labridae), in a temperate no-take marine reserve. Marine Biology 147, 301-311.
## 47                                                                                                                              Bradbury C, Green JM, Bruce-Lockhart. 1995. Home ranges of female cunner, Tautogolabrus adspersus (Labridae), as determined by ultrasonic telemetry. Canadian Journal of Zoology 73, 1268-1279.
## 48                                                                                                                                                                             Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
## 49                                                               Robertson DR, Choat JH. 1974. Protogynous Hermaphroditism and Social Systems in Labrid Fish. In: Proc. Int. Coral Reef Symp., 2nd ed. (Cameron, A.M., B.M. Cambell, A.B. Cribb, R.Endean, J.S. Jell, O.A. Jones, P. Mather and F.H. Talbot, eds.), 1, 217-226.
## 50                                                                                                                                           Nanami A, Yamada H. 2009. Site fidelity, size, and spatial arrangement of daytime home range of thumbprint emperor Lethrinus harak (Lethrinidae). Fisheries Science 75, 1109-1116.
## 51                                                                                                                                                                               Farmer NA, Ault JS. 2011. Grouper and snapper movements and habitat use in Dry Tortugas, Florida. Marine Ecology Progress Series 433, 169-184.
## 52                                                                                                                                                          Hammerschlag-Peyer CM, Layman CA. 2010. Intrapopulation variation in habitat use by two abundant coastal fish species. Marine Ecology Progress Series 415, 211-220.
## 53                                                                                                Nanami A, Yamada H. 2008. Size and spatial arrangement of home range of checkered snapper Lutjanus decussatus (Lutjanidae) in an Okinawan coral reef determined using a portable GPS receiver. Marine Biology 153, 1103-1111.
## 54                                                                                                                                                          Hammerschlag-Peyer CM, Layman CA. 2010. Intrapopulation variation in habitat use by two abundant coastal fish species. Marine Ecology Progress Series 415, 211-220.
## 55                                                                                                                                                                               Farmer NA, Ault JS. 2011. Grouper and snapper movements and habitat use in Dry Tortugas, Florida. Marine Ecology Progress Series 433, 169-184.
## 56                                                                                                                                      Bellquist LF, Lowe CG, Caselle JE. 2008. Fine-scale movement patterns, site fidelity, and habitat selection of ocean whitefish (Caulolatilus princeps). Fisheries Research 91, 325-335.
## 57                                                                                                                                                             Pita P, Freire J. 2011. Movements of three large coastal predatory fishes in the northeast Atlantic: a preliminary telemetry study. Scientia Marina 75, 759-770.
## 58                                                                                                              Holland KN, Peterson JD, Lowe CG, et al. 1993. Movements, Distribution and Growth Rates of The White Goatfish Mulloides flavolineatus in a Fisheries Conservation Zone. Bulletin of Marine Science 52: 982-992.
## 59                                                                                 Meyer CG, Holland KN, Wetherbee BM, et al. 2000. Movement patterns, habitat utilization, home range size and site fidelity of whitesaddle goatfish, Parupeneus porphyreus, in a marine reserve. Environmental Biology of Fishes 59, 235-242.
## 60                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 61                                                                                                                                                          Mapstone GM, Wood EM. 1975. The ethology of Abudefduf luridus and Chromis chromis (Pisces: Pomacentridae) from the Azores. Journal of Zoology, London 175, 179-199.
## 62                                                                                                                                                                                                       Luckhurst BE, Luckhurst K. 1978. Diurnal Space Utilization in Coral Reef Fish Communities. Marine Biology 49, 325-332.
## 63                                                                                                                                                          Mapstone GM, Wood EM. 1975. The ethology of Abudefduf luridus and Chromis chromis (Pisces: Pomacentridae) from the Azores. Journal of Zoology, London 175, 179-199.
## 64                                                                                                                                                                          Keenleyside MHA. 1972. The Behaviour of Abudefduf zonatus (Pisces, Pomacentridae) at Heron Island, Great Barrier Reef. Animal Behavior 20, 763-774.
## 65                                                                                                                                                                                                Sale PF. 1971. Extremely Limited Home Range in a Coral Reef Fish, Dascyllus aruanus (Pisces; Pomacentridae). Copeia, 324-327.
## 66                                                                                                                         Sale PF. 1974. Mechanisms of co-existence in a guild of territorial fishes at Heron Island. pp. 193-206. In: Proc. Second Intern. Symp. Coral Reefs, Vol. 1, Great Barrier Reef Committee. Brisbane.
## 67                                                                                                                                                                                                  Sale PF. 1978. Coexistence of coral reef fishes - a lottery for living space. Environmental Biology of Fishes 3(1), 85-102.
## 68                                                                                                                                                                                                       Luckhurst BE, Luckhurst K. 1978. Diurnal Space Utilization in Coral Reef Fish Communities. Marine Biology 49, 325-332.
## 69                                                                                                                                                                         Gronell A. 1980. Space utilization by the cocoa damselfish Eupomacentrus variabilis (Pisces: Pomacentridae). Bulletin of Marine Science 30, 237-251.
## 70                                                                                                                            Welsh JQ, Bellwood DR. 2011. Spatial ecology of the steephead parrotfish (Chlorurus microrhinos): an evaluation using acoustic telemetry. Coral Reefs 31, 55-65. (doi: 10.1007/s00338-011-0813-8)
## 71                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
## 72                                                                                                                                                  Welsh JQ, Bellwood DR. .2012. How far do schools of roving herbivores rove? A case study using Scarus rivulatus. Coral Reefs 31, 991-1003. (doi: 10.1007/s00338-012-0922-z)
## 73                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
## 74                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
## 75                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
## 76                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
## 77                                                                                                              Shpigel M, Fishelson L. 1991. Territoriality and associated behaviour in three species of the genus Cephalopholis (Pisces: Serranidae) in the Gulf of Aqaba, Red Sea. Journal of Fisheries Biology 38, 887-896.
## 78                                                                                                                                       Popple ID, Hunte W. 2005. Movement patterns of Cephalopholis cruentata in a marine reserve in St Lucia, W.I., obtained from ultrasonic telemetry. Journal of Fish Biology 67, 981-992.
## 79                                                                                                              Shpigel M, Fishelson L. 1991. Territoriality and associated behaviour in three species of the genus Cephalopholis (Pisces: Serranidae) in the Gulf of Aqaba, Red Sea. Journal of Fisheries Biology 38, 887-896.
## 80                                                                                                              Shpigel M, Fishelson L. 1991. Territoriality and associated behaviour in three species of the genus Cephalopholis (Pisces: Serranidae) in the Gulf of Aqaba, Red Sea. Journal of Fisheries Biology 38, 887-896.
## 81                                                                                                                             Shapiro DY, Garcia-Moliner G, Sadovy Y. 1994. Social system of an inshore stock of the red hind grouper, Ephephelus guttatus (Pisces : Serranidae). Environmental Biology of Fishes 41, 415-422.
## 82                                                                                 Lembo G, Spedicato MT, \xd8kland F, et al. 2002. A wireless communication system for determining site fidelity of juvenile dusky groupers Epinephelus marginatus (Lowe, 1834) using coded acoustic transmitters. Hydrobiologia 483, 249-257.
## 83                                                                                                                                                                               Farmer NA, Ault JS. 2011. Grouper and snapper movements and habitat use in Dry Tortugas, Florida. Marine Ecology Progress Series 433, 169-184.
## 84                                                                                                                  Bolden SK. 2001. Using Ultrasonic Telemetry to Determine Home Range of a Coral-Reef Fish. In: Sibert JR, Nielsen JL, eds. Electronic Tagging and Tracking in Marine Fisheries New York, NY: Springer. 484p.
## 85                                                                                                                 Kaunda-Arara B, Rose GA. 2004. Homing and site fidelity in the greasy grouper Epinephelus tauvina (Serranidae) within a marine protected area in coastal Kenya. Marine Ecology Progress Series 277, 245-251.
## 86                                                                                                                                             Jones GP. 1980. Contribution to the biology of the redbanded perch, Ellerkeidia huntii (Hector), with a discussion on hermaphroditism. Journal of Fisheries Biology 17, 197-207.
## 87                                                Kingsford MJ, Carlson IJ. 2010. Patterns of distribution and movement of fishes, Ophthalmolepis lineolatus and Hypoplectrodes maccullochi, on temperate rocky reefs of south eastern Australia. Environmental Biology of Fishes 88, 105-118. (doi: 10.1007/s10641-010-9621-1)
## 88                                                                                                                                                                               Farmer NA, Ault JS. 2011. Grouper and snapper movements and habitat use in Dry Tortugas, Florida. Marine Ecology Progress Series 433, 169-184.
## 89                                                                                           Lowe CG, Topping DT, Cartamil DP, et al. 2003. Movement patterns, home range, and habitat utilization of adult kelp bass Paralabrax clathratus in a temperate no-take marine reserve. Marine Ecology Progress Series 256, 205-216.
## 90                                                                                                                                                  Mason TJ, Lowe CG. 2010. Home range, habitat use, and site fidelity of barred sand bass within a southern California marine protected area. Fisheries Research 106, 93-101.
## 91                                                                                                                                                                          Hutchinson N, Rhodes KL. 2010. Home range estimates for squaretail coralgrouper, Plectropomus areolatus (R\xfcppell 1830). Coral Reefs 29: 511-519.
## 92                                                                                                                                                                        Zeller DC. 1997. Home range and activity patterns of the coral trout Plectropomus leopardus (Serranidae). Marine Ecology Progress Series. 154, 65-77.
## 93                                                                                               Al\xf3s J, March D, Palmer M, Grau A, Morales-Nin. 2011. Spatial and temporal patterns in Serranus cabrilla habitat use in the NW Mediterranean revealed by acoustic telemetry. Marine Ecology Progress Series 427, 173 - 186.
## 94                                                                                                         March D, Palmer M, Al\xf3s J, et al. 2010. Short-term residence, home range size and diel patterns of the painted comber Serranus scriba in a temperate marine reserve. Marine Ecology Progress Series 400, 195-206.
## 95                                                                                                            Jadot C, Donnay A, Acolas ML, et al. 2006. Activity patterns, home-range size, and habitat utilization of Sarpa salpa (Teleostei: Sparidae) in the Mediterranean Sea. ICES Journal of Marine Science 63, 128-139.
## 96                                                                                                                           Parsons DM, Babcock RC, Hankin RKS, et al. 2003. Snapper Pagrus auratus (Sparidae) home range dynamics: acoustic tagging studies in a marine reserve. Marine Ecology Progress Series 262, 253-265.
## 97                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 98                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 99                                                                                                                                                                                   Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 100                                                                                                                                                                                  Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 101                                                                                                                                                                                  Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 102                                                                                                                                                                                  Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 103                                                                                                                                                                                  Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 104                                                                                                                                                                                  Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 105                                                                  Tolimieri N, Andrews K, Williams G, et al. 2009. Home range size and patterns of space use by lingcod, copper rockfish and quillback rockfish in relation to diel and tidal cycles. Marine Ecology Progress Series. 380, 229-243. (doi: 10.3354/meps07930)
## 106                                                                                                             Mitamura H, Uchida K, Miyamoto Y, et al. 2009. Preliminary study on homing, site fidelity, and diel movement of black rockfish Sebastes inermis measured by acoustic telemetry. Fisheries Science 75, 113-1140.
## 107                                                                  Tolimieri N, Andrews K, Williams G, et al. 2009. Home range size and patterns of space use by lingcod, copper rockfish and quillback rockfish in relation to diel and tidal cycles. Marine Ecology Progress Series. 380, 229-243. (doi: 10.3354/meps07930)
## 108                                                                                                                                                                         Green KM, Starr RM. 2011. Movements of small adult black rockfish: implications for the design of MPAs. Marine Ecology Progress Series 14, 219-230.
## 109                                                                                                                                       Jorgensen SJ, Kaplan DM, Klimley AP, et al. 2006. Limited movement in blue rockfish Sebastes mystinus: internal structure of home range. Marine Ecology Progress Series 327, 157-170.
## 110                                                                                                                                                                                  Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
## 111                                                                                                                               Curtis JMR, Vincent CJ. 2006. Life history of an unusual marine fish: survival, growth and movement patterns of Hippocampus guttulatus Cuvier 1829. Journal of Fisheries Biology 68, 707-733.
## 112                                                                               Monteiro NM, da Natividade Viera M, Almada V. 2005. Homing behaviour and individual identification of the pipefish Nerophis lumbriciformis (Pisces; Syngnathidae): a true intertidal resident? Estuarine and Coastal Shelf Science 63, 93-99.
## 113                                                                                                                                                    Sikkel PC. 1990. Social organization and spawning in the Atlantic sharpnose puffer, Canthigaster rostrata (Tetraodontidae). Environmental Biology of Fishes 27, 243-254.
## 114                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 115                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 116                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 117                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 118                                                                                                                  Martinez JE, Pagan I, Palazon JA, Calvo JF. 2007. Habitat use of booted eagles (Hieraaetus pennatus) in a Special Protection Area: implications for conservation. Biodiversity Conservation 16, 3481-3488.
## 119                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 120                                                                                                           Namgail T, Takekawa JY, Balachandran S, Sathiyaselvam P, Mundkur T, Newman SH. 2014. Space use of wintering waterbirds in India: Influence of trophic ecology on home-range size. Current Zoology 60(5), 616-621.
## 121                                                                                                                 Miles JRG Miles, Potter MA, Fordham RA. 1997. Northern brown kiwi (Apteryx australis mantelli) in Tongariro National Park and Tongariro Forest \x97 ecology and threats. Science for Conservation 51, 1-23.
## 122                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 123                                                                                                        Schwemmer P, Garthe S. 2011. Spatial and temporal patterns of habitat use by Eurasian oystercatchers (Haematopus ostralegus) in the eastern Wadden Sea revealed using GPS data loggers. Marine Biology 158, 541-550.
## 124                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 125                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 126                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 127                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 128                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 129                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 130                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 131                                                                                               Kelley SW, Ransom D, Butcher JA, Schulz GG, Surber BW, Punchak WE, Santamaria CA, Hurtado LA. 2011. Home range dynamics, habitat selection, and survival of Greater Roadrunners. Journal of Field Ornithology 82(2), 165-174.
## 132                                                                                                                                                                             Karubuan J, Carrasco L. 2008. Home Range and Habitat Preferences of the Banded Ground-cuckoo. The Wilson Journal of Ornithology 120(1):205-209.
## 133                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 134                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 135                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 136                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 137                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 138                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 139                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 140                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 141                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 142                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 143                                                                                                                                                              Dwyer JF, Fraser JD, Morrison JL. 2013. Range sizes and habitat use of non-breeding Crested Caracaras in Florida. Journal of Field Ornithology 84(3), 223-233.
## 144                                                                                                                                                 Thiollay J-M. 2008. Foraging, home range use and social behaviour of a group-living rainforest raptor, the Red-throated Caracara Daptrius americanus. Ibis 133(4), 382-393.
## 145                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 146                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 147                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 148                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 149                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 150                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 151                                                                                                                                                                           Eng RL, Schladweiler P. 1972. Sage Grouse Winter Movements and Habitat Use in Central Montana. The Journal of Wildlife Management 36(1), 141-146.
## 152                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 153                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 154                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 155                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 156                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 157 Patten, M. A., C. L. Pruett, and D. H. Wolfe. 2011. Home range size and movements of Greater Prairie-Chickens. Pp. 51\x9662 in B. K. Sandercock, K. Martin, and G. Segelbacher (editors). Ecology, conservation, and management of grouse. Studies in Avian Biology (no. 39), University of California Press, Berkeley, CA.
## 158                                                                  Karubian J, Carrasco L, Mena P, Olivio J, Cabrera D, Castillo F, Duraes R, El Ksabi N. 2011. nesting Biology, Home Range, and Habitat Use of the Brown Wood Rail (Aramides wolfi) in Northwest Ecuador. The Wilson Journal or Ornithology 123(1), 137-141.
## 159                                                                                                                                                                     Grabovsky VI. 1993.Spatial Distribution and Spacing Behaviour of Males in a Russion Corncrake (Crex crex) Population. Gibier Faune Sauvage 10, 259-279.
## 160                                                                                                                                                              Pickens BA, King SL. 2013. Microhabitat Selection, Demography and Correlates of Home Range Size for the King Rail (Rallus elegans). Waterbirds 36(3), 319-329.
## 161                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 162                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 163                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 164                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 165                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 166                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 167                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 168                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 169                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 170                       Nolazco S, Sanchez AM, Roper JJ. 2014. Tama\xf1o poblacional, distribuci\xf3n y \xe1mbito de hogar de la Cortarrama Peruana (Phytotoma raimondii) en el Santuario Hist\xf3rico Bosque de P\xf3mac, Lambayeque, Per\xfa. Bolet\xedn de la Uni\xf3n de Ornit\xf3logos del Per\xfa (UNOP), 9 (2): 5-19 .
## 171                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 172                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 173                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 174                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 175                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 176                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 177                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 178                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 179                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 180                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 181                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 182                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 183                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 184                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 185                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 186                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 187                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 188                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 189                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 190                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 191                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 192                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 193                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 194                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 195                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 196                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 197                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 198                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 199                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 200                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 201                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 202                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 203                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 204                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 205                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 206                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 207                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 208                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 209                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 210                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 211                                                                                                                                                                   Frith CB, Frith DW. 2001. Morphology, Moult, and Survival in Three Sympatric Bowerirds in Australian Wet Tropics Upland Rainforest. Corella 25(3), 41-60.
## 212                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 213                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 214                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 215                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 216                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 217                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 218                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 219                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 220                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 221                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 222                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 223                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 224                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 225                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 226                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 227                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 228                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 229                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 230                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 231                                                                                                                                                                      Gilbert G, Tyler G, Smith KW. 2005. Behaviour, home-range size and habitat use by male Great Bittern Botaurus stellaris in Britain. Ibis 147, 533-543.
## 232                                                                                                                                                                              Bogner HE, Baldassarre GA. 2002. Home Range, Movement, and Nesting of Least Bitterns in Western New York. The Wilson Bulletin 114(3), 297-308.
## 233                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 234                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 235                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 236                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 237                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 238                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 239                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 240                                                                                                                                                                                                      Farrimond M, Clout MN. 2006. Home range size of kakapo (Strigops habroptilus) on Codfish Island. Notornis 53, 150-152.
## 241                                                                                                                                           Bellis LM, Martella MB, Navarro JL, Vignolo PE. 2004. Home range of greater and lesser rhea in Argentina: relevance to conservation. Biodiversity and Conservation 13, 2589-2598.
## 242                                                                                                                                           Bellis LM, Martella MB, Navarro JL, Vignolo PE. 2004. Home range of greater and lesser rhea in Argentina: relevance to conservation. Biodiversity and Conservation 13, 2589-2598.
## 243                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 244                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 245                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 246                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 247                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 248                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 249                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 250                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 251                                                                                                                                      Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
## 252                                                                                                               Williams JB, Siegfried WR, Milton SJ, Adams NJ, Dean WRT, du Plessis MA, Jackson S. 1993. Field Metabolism, Water Requirements, and Foraging Behavior of Wild Ostriches in the Namib. Ecology 74(2), 390-404.
## 253                                                                                                                                                                                                                                         Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
## 254                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 255                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 256                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 257                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 258                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 259                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 260                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 261                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 262                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 263                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 264                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 265                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 266                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 267                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 268                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 269                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 270                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 271                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 272                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 273                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 274                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 275                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 276                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 277                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 278                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 279                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 280                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 281                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 282                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 283                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 284                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 285                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 286                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 287                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 288                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 289                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 290                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 291                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 292                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 293                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 294                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 295                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 296                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 297                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 298                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 299                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 300                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 301                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 302                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 303                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 304                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 305                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 306                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 307                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 308                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 309                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 310                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 311                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 312                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 313                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 314                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 315                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 316                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 317                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 318                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 319                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 320                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 321                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 322                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 323                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 324                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 325                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 326                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 327                                                                                                                                                                              Palomares F. 1994. Site fidelity and effects of body mass on home-range size of Egyptian mongooses. Canadian Journal of Zoology 72, 465 - 469.
## 328                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 329                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 330                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 331                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 332                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 333                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 334                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 335                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 336                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 337                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 338                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 339                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 340                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 341                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 342                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 343                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 344                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 345                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 346                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 347                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 348                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 349                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 350                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 351                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 352                                                                                                  Belcher CA, Darrant JP. 2004. Home range and spatial organization of the marsupial carnivore, Dasyurus maculatus maculatus (Marsupialia: Dasyuridae) in south-eastern Australia. Journal of Zoology (London) 262, 271-280.
## 353                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 354                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 355                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 356                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 357                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 358                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 359                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 360                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 361                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 362                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 363                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 364                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 365                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 366                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 367                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 368                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 369                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 370                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 371                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 372                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 373                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 374                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 375                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 376                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 377                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 378                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 379                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 380                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 381                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 382                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 383                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 384                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 385                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 386                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 387                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 388                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 389                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 390                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 391                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 392                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 393                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 394                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 395                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 396                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 397                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 398                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 399                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 400                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 401                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 402                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 403                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 404                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 405                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 406                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 407                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 408                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 409                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 410                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 411                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 412                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 413                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 414                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 415                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 416                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 417                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 418                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 419                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 420                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 421                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 422                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 423                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 424                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 425                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 426                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 427                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 428                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 429                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 430                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 431                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 432                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 433                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 434                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 435                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 436                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 437                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 438                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 439                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 440                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 441                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 442                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 443                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 444                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 445                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 446                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 447                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 448                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 449                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 450                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 451                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 452                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 453                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 454                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 455                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 456                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 457                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 458                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 459                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 460                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 461                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 462                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 463                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 464                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 465                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 466                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 467                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 468                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 469                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 470                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 471                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 472                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 473                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 474                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 475                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 476                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 477                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 478                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 479                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 480                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 481                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 482                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 483                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 484                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 485                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 486                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 487                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 488                                                                                                                                  Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
## 489                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 490                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 491                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
## 492                                                                                                          Cunningham P. 2000. Daily activity pattern and diet of a population of the Spinytailed Lizard, Uromastyx aegyptius microlepis, during summer in the United Arab Emirates. Zoology in the Middle East 21(1), 37-46.
## 493                                                                                                                                                             Clark DR. 1970. Age-Specific "Reproductive Effort" in the Worm Snake Carphophis vermis (Kennicott). Transactions of the Kansas Academy of Science 73(1), 20-24.
## 494                                                                                                                                                              Barbour RW, Harvey MJ, and Hardin JW. 1969. Home Range, Movements, and Activity of the Eastern Worm Snake, Carphophis Amoenus Amoenus. Ecology 50(3), 470-476.
## 495                                                                                                                       Carfagno GLF, Weatherhead PJ. 2008. Energetics and space use: intraspecific and interspecific comparisons of movements and home ranges of two Colubrid snakes. Journal of Animal Ecology 77, 416-424.
## 496                                                                              Klug PE, Fill J, With KA. 2011. Spatial ecology of Eastern yellow-bellies racer (Coluber constrictor flaviventris) and great plains rat snake (Pantherophis emoryi) in a contiguous tallgrass-prairie landscape. Herpetologica 67(4), 428-439.
## 497                                                                                                                                                 Fitch HS. 1975. A Demographic Study of the Ringneck Snake (Diadophis punctatus) in Kansas. University of Kansas Museum of Natural History Miscellaneous Publication No. 62.
## 498                                                                                                                                                                                Dodd CK, Barichivich WJ. 2007. Movements of large snakes (Drymarchon, Masticophis_ in North-central Florida. Florida Scientist 70(1), 83-94.
## 499                                                                              Klug PE, Fill J, With KA. 2011. Spatial ecology of Eastern yellow-bellies racer (Coluber constrictor flaviventris) and great plains rat snake (Pantherophis emoryi) in a contiguous tallgrass-prairie landscape. Herpetologica 67(4), 428-439.
## 500                                                                                                                       Carfagno GLF, Weatherhead PJ. 2008. Energetics and space use: intraspecific and interspecific comparisons of movements and home ranges of two Colubrid snakes. Journal of Animal Ecology 77, 416-424.
## 501                                                                                                                                                     Plummer MV, Mills NE. 2000. Spatial Ecology and Survivorship of Resident and Translocated Hognose Snakes (Heterodonplatirhinos). Journal of Herpetology 34(4), 565-575.
## 502                                                                                                                                Herbe L, Moreau C, Blouin-Demers G, Bonnet X, Lourdais O. 2012. Two Syntopic Colubrid Snakes Differ In Their Energetic Requirements and In Their Use of Space. Herpetologica 68(3), 358-364.
## 503                                                                                                 Linehan JM, Smith LL, Steen DA. 2010. Ecology of the Eastern kingsnake (Lampropeltis getula getula) in a longleaf pine (Pinus palustris) forest in Southwestern Georgia. Herpetological Conservation Biology 5(1), 94-101. 
## 504                                                                                                                                                                                                  Row JR, Blouin-Demers G. 2006. Kernels are not Accurate Estimators of Home-Range Size For Herpetofauna. Copeia 4, 797-802.
## 505                                                                                                                                                                                Dodd CK, Barichivich WJ. 2007. Movements of large snakes (Drymarchon, Masticophis_ in North-central Florida. Florida Scientist 70(1), 83-94.
## 506                                                                                                                                                                             Madsen T. 1984. Movements, Home Range Size and Habitat Use of Radio-Tracked Grass Snakes (Natrix natrix) in Southern Sweden. Copeia 3, 707-713.
## 507                                                                                                                                          Roe JH, Kingsbury BA, Herbert NR. 2004. Comparative water snake ecology: conservation of mobile animals that use temporally dynamic resources. Biological Conservation 118, 79-89.
## 508                                                                                                                                          Roe JH, Kingsbury BA, Herbert NR. 2004. Comparative water snake ecology: conservation of mobile animals that use temporally dynamic resources. Biological Conservation 118, 79-89.
## 509                                                                                                                                            Lee H-J, Lee J-H, Park D. 2011. Habitat Use and Movement Patterns of the Viviparous Aquatic Snake, Oocatochus rufodorsatus, from Northeast Asia. Zoological Science 28, 593-599.
## 510                                                                                                                                                                                         Rodriguez-Robles JA. 2003. Home Ranges of Gopher Snakes (Pituophis catenifer, Colubridae) in Central California. Copeia 2, 391-396.
## 511                                                                                                                                                        Miller GJ, Smith LL, Johnson SA, Franz R. 2012. Home Range Size and Habitat Selection in the Florida Pine Snake (Pituophis melanoleucus mugitus). Copeia 4, 706-713.
## 512                                                                                                                                                                                   Freedman B, Catling PM. 1979. Movements of sympatric species of snakes at Amherstburg, Ontatio. Canadian Field-Naturalist 93(4): 399-404.
## 513                                                                         Wylie G, Amarello M. 2006.  For the Bank Protection Project on the Left Bank of the Colusa Basin Drainage Canal in Reclamation District. Progress report for the U.S. Army Corps of Engineers.\nSacramento River Bank Protection Project, Phase II.
## 514                                                                                                                                Herbe L, Moreau C, Blouin-Demers G, Bonnet X, Lourdais O. 2012. Two Syntopic Colubrid Snakes Differ In Their Energetic Requirements and In Their Use of Space. Herpetologica 68(3), 358-364.
## 515                                                                                                                                                       Webb JK, Shine R. 1997. A Field Study of Spatial Ecology and Movements of a Threatened Snake Species, Hoplocephalus bungaroides. Biological Conservation 82, 203-217.
## 516                                                                                                                                        Butler H, Malone B, Clemann N. 2005. The effects of translocation on the spatial ecology of tiger snakes (Notechis scutatus) in a suburban landscape. Wildlife Research 32, 165-171.
## 517                                                                                                                                 Shine R. 1987. Intraspecific Variation in Thermoregulation, Movements and Habitat Use by Australian Blacksnakes, Pseudechis porphyriacus (Elapidae). Journal of Herpetology 21(3), 165-177.
## 518                                                                                                                                                     Christian KA, Tracy CR. 1985. Physical and biotic determinants of space utilization by the Galapagos land iguana (Conolophus pallidus). Oecologia (Berlin) 66, 132-140.
## 519                                                                                                                                                                       Knapp CR, Owens AK. 2005. Home range and habitat associations of a Bahamian iguana: implications for conservation. Animal Conservation 8(3), 269-278.
## 520                                                                                                                                       Goodman RM, Echternact AC, Burton FJ. 2005. Spatial Ecology of the Endangered Iguana, Cyclura lewisi, in a Disturbed Setting on Grand Cayman. Journal of Herpetology 39(3), 402-408. 
## 521                                                                                                                                 Mitchell NC. 1999. Effect of Introduced Ungulates on Density, Dietary Preferences, Home Range, and PhysicalCondition of the Iguana (Cyclura pinguis) on Anegada. Herpetologica 55(1), 7-17.
## 522                                                                                                                                                                                  Smits AW. 1985. Behavioral and Dietary Responses to Aridity in the Chuckwalla, Sauromalus hispidus. Journal of Herpetology 19(4), 441-449.
## 523                                                                                                                                                                    Johnson SR. 1965. An Ecological Study of the Chuckwalla, Sauromalus obesus Baird, in the Western Mojave Desert. American Midland Naturalist 73(1), 1-29.
## 524                                                                                                                                                                                                   Alberts AC. 1993. Relationship of Space Use to Population Density in an Herbivorous Lizard. Herpetologica 49(4), 469-479.
## 525                                                                                                                                                                                Borja MM. 1985. Spatial and Temporal behaviour of Gallotia galloti in a Natural Population of Tenerife. Bonn. Zool. Beitr. 36(3/4), 541-552.
## 526                                                                                                               D\xedaz SA. 2007. Relevant autecological aspects for phymaturus flagellifer (reptilia, Tropiduridae) conservation in the altos de lircay national reserve, Maule region. Thesis, University of Chile, 41pp.\n
## 527                                                                                                                                      Pearson D, Shine R, Williams A. 2005. Spatial ecology of a threatened python (Morelia spilota imbricata) and the effects of anthropogenic habitat change. Austral Ecology 30, 261-274.
## 528                                                                                                                                       Osterwalder K, Klingenbock A, Shine R. 2004. Field studies on a social lizard: Home range and social organization in an Australian skink, Egernia major. Austral Ecology 29, 241-249.
## 529                                                                                                             Smith CF, Schuett GW, Early RL, Schwenk K. 2009. The Spatial and Resproductive Ecology of the Copperhead (Agkistrodon contortrix) at the Northeastern Extrme of its Range. Herpetological Monographs 23, 45-73.
## 530                                                                                                                                                                                  Roth ED. 2005. Spatial Ecology of a Cottonmouth (Agkistrodon piscivorus) Population in East Texas. Journal of Herpetology  39(2), 308-312.
## 531                                                                                                                                                                                       Maritz B, Alexander GJ. 2012. Dwarfs on the Move: Spatial Ecology of the World's Smallest Viper, Bitis schneideri. Copeia 1, 115-120.
## 532                                                                                                             Wasko DK, Sasa M. 2012. Food resources influence spatial ecology, habitat selection, and foraging behavior in an ambush-hunting snake (Viperidae: Bothrops asper): an experimental study. Zoology 115, 179-187.
## 533                                                                                                                                                                                  Beck DD. 1995. Ecology and Energetics of Three Sympatric Rattlesnake Species in the Sonoran Desert. Journal of Herpetology 29(2), 211-223.
## 534                                                                                                                                                                                           Secor SM. 1994. Ecological Significance of Movements and Activity Range for the Sidewinder, Crotalus cerastes. Copeia 3, 631-645.
## 535                                                                      Bauder JM, Blodgett D, Briggs KV, Jenkins CL. 2011. The Ecology of Timber Rattlesnakes (Crotalus horridus) in Vermont: A First Year Progress Report Submitted to the Vermont Department of Fish and Wildlife. Vermont Department of Fish and Wildlife.
## 536                                                                                                                                                                                  Beck DD. 1995. Ecology and Energetics of Three Sympatric Rattlesnake Species in the Sonoran Desert. Journal of Herpetology 29(2), 211-223.
## 537                                                                                                                                                                Parker JM, Anderson SH. 2007. Ecology and Behavior of the Midget Faded Rattlesnake (Crotalus Oreganus Concolor) in Wyoming. Journal of Herpetology 1, 41-51.
## 538                                                                                                                                Prival DB, Goode MJ, Swann DE, Schwalbe CR, Schroff MJ. 2002. Natural History of a Northern Population of Twin-Spotted Rattlesnakes, Crotalus pricei. Journal of Herpetology 36(4), 598-607.
## 539                                                                                                                                                                                                                          Cardwell MD. 2008. The reproductive ecology of Mohave rattlesnakes. Journal of Zoology 274, 65-76.
## 540                                                                                                                                                                                  Beck DD. 1995. Ecology and Energetics of Three Sympatric Rattlesnake Species in the Sonoran Desert. Journal of Herpetology 29(2), 211-223.
## 541                                                                                                                                                                Shine R, Sun L-X. 2003. Attack strategy of an ambush predator: which attributes of the prey trigger a pit-viper\x92s strike? Functional Ecology 17, 340-348.
## 542                                                                                                                                                              Ettling JA, Aghasyan LA, Aghasyan AL, Parker PG. 2013. Spatial Ecology of Armenian Vipers, Montivipera raddei, in a Human-Modified Landscape. Copeia 1, 64-71.
## 543                                                                                                                                                           Brito JC. 2003. Seasonal Variation in Movements, Home Range, and Habitat Use by Male Vipera latastei in Northern Portugal. Journal of Herpetology 37(1), 155-160.
## 544                                                                                                              Roe JH, Georges A. 2008. Terrestrial activity, movements and spatial ecology of an Australian freshwater turtle, Chelodina longicollis, in a temporally dynamic wetland system. Austral Ecology 33, 1045-1056.
## 545                                                                     Forero-Medina G, Cardenas-Arevalo G, Castano-Mora OV. 2011. Abundance, Home Range, and Movement Patterns of the Endemic Species Dahl\x92s Toad-Headed Turtle (Mesoclemmys dahli) in Cesar, Colombia. Chelonian Conservation and Biology 10(2), 228-236.
## 546                                                                                                                        Brown GP, Bishop CA, Brooka RJ. 1994. Growth Rate, Reproductive Output, and Temperature Selection of Snapping Turtles inHabitats of Different Productivities. Journal of Herpetology 28(4), 405-410.
## 547                                                                                           Rowe JW, Dalgarn SF. 2010. Home Range Size and Daily Movements of Midland Painted turtles (Cyrusemys picta marginata) in Relation to Bosy Size, Sex, and Weather Patterns. Herpetological Conservation and Biology 5(3), 461-473.
## 548                                                                                                                                                           Buhlmann KA. 1995. Habitat Use, Terrestrial Movements, and Conservation of the Turtle, Deirochelys reticulariain Virginia. Journal of Herpetology 29(2), 173-181.
## 549                                                                                                                                                       Innes RJ, Babbitt KJ, Kanter JJ. 2008. Home Range and Movement of Blanding's Turtles (Emydoidea blandingii) in New Hampshire. Northeastern Naturalist 15(3), 431-444.
## 550                                                                                              P\xe9rez-Santigosa N, Hidalgo-Vila J, D\xedaz-Paniagua C. 2013. Comparing Activity Patterns and Aquatic Home Range Areas Among Exotic and Native Turtles in Southern Spain. Chelonian Conservation and Biology 12(2), 313-319.
## 551                                                                                                                                                                                             Jones RL. 1996. Home Range and Seasonal Movements of the Turtle Graptemys flavimaculata. Journal of Herpetology 30(3), 376-385.
## 552                                                                                                                               Bernstein NP, Richtsmeier RJ., Black RW, Montgomery BJ. 2007. Home Range and Philopatry in the Ornate Box Turtle, Terrapene ornata ornata, in Iowa. American Midland Naturalist 157, 162-174.
## 553                                                                                              P\xe9rez-Santigosa N, Hidalgo-Vila J, D\xedaz-Paniagua C. 2013. Comparing Activity Patterns and Aquatic Home Range Areas Among Exotic and Native Turtles in Southern Spain. Chelonian Conservation and Biology 12(2), 313-319.
## 554                                                                                                      Cordero GA, Reeves R, Swarth CW. 2012. Home-Range Size of an Eastern Mud Turtle, Kinosternon subrubrum, Population in the Mid-Atlantic Region of the United States. Chelonian Conservation and Biology 11(1), 121-124.
## 555                                                                                                                   Ennen JR, Scott AF. 2013. Home-Range Size of an Eastern Mud Turtle, Kinosternon subrubrum, Population in the Mid-Atlantic Region of the United States. Chelonian Conservation and Biology 12(1), 199-203.
## 556                                                                                                        Rowe JW, Lehr GC, McCarthy PM, Converse PM. 2009. Activity, Movements and Activity Area Size in Stinkpot Turtles (Sternotherus odoratus) in Southwestern Michigan Lake. American Midland Naturalist 162(2), 266-275.
## 557                                                  Monta\xf1o RR, Cu\xe9llar E, Fitzgerald LA, Soria F, Mendoza F, Pe\xf1a R, Dosapey T, Deem SL, Noss AJ. 2013. Ranging patterns by the red-footed tortoise - Geochelone carbonaria (Testudines: Testudinidae) - in the Bolivian Chaco. Ecolog\xeda en Bolivia 48(1), 17-30.
## 558                                                                                                                                                                   Duda JJ, Krzysik AJ, Freilich JE. 1999. Effects of Drought on Desert Tortoise Movement and Activity. The Journal of Wildlife Management 63(4), 1181-1192.
## 559                                                                                                                                                                                   Diemer JE. 1992. Home Range and Movements of the Tortoise Gopherus polyphemus in Northern Florida. Journal of Herpetology 26(2), 158-165.
## 560                                                                                                                                                                    Vasudevan, K., Pandav, B & Deepak, V. 2010.Ecology of two endemic turtles in the Western Ghats. Final Technical Report, Wildlife Institute of India 74p.
## 561                                                                                                                                  Hailey A, Coulson IM. 1996. Home Range Use and Seasonal Movements of the Egyptian Tortoise (Testudo kleinmanni) in the Northwestern Negev, Israel. Canadian Journal of Zoology 74, 97-102.
## 562                                                                                      Wanchai P, Stanford CB, Thirakhupt K, Thankhikorn S. 2012. Home Range of the Impressed Tortoise, Manouria impressa (G\xfcnther,1882) at Phu Luang Wildlife Sanctuary, Loei Province, Thailand. Tropical Natural History 12(2), 165-174
## 563                                                                                                                                             Cunningham PL, Sumang A. 2008. Ecology of the Bushmanland Tent Tortoise (Psammobates tentorius verroxii) in Southern Namibia. Chelonian Conservation and biology 7(1), 119-124.
## 564                                                                                                                                             McMaster MK, Downs CT. 2009. Home Range and Daily Movement of Leopard Tortoises (Stigmochelys pardalis) in the Nama-Karoo, South Africa. Journal of Herpetology 43(4), 561-569.
## 565                                                                               Anadon JD, Gimenez A, Perez I, Martinez M, Esteve MA. 2006. Habitat selection by the spur-thighed tortoise Testudo graeca in a multisuccessional landscape: implications for habitat management. Biodiversity and Conservation 15, 2287-2299.
## 566                                                                                                                                   Rozylowicz L, Popescue VD. 2013. Habitat selection and movement ecology of eastern Hermann\x92s tortoises in a rural Romanian landscape. European Journal of Wildlife Research 59, 47-55.
## 567                                                                                                                      Lagarde F, Bonnet X, Henen B, Legrand A, Borbin J, Nagy K, Naulleau G. 2003. Sex divergence in space utilisation in the steppe tortoise (Testudo horsfieldi). Canadian Journal of Zoology 81, 380-387.
## 568                                                                                                                                         Geffen E, Mendelssohn H. 1988. Home Range Use and Seasonal Movements of the Egyptian Tortoise (Testudo kleinmanni) in the Northwestern Negev, Israel. Herpetologica 44(3), 354-359.
## 569                                                                 Galois P, Leveille M, Bouthillier L, Daigle C, Parren S. 2002. Movement Patterns, Activity, and Home Range of the Eastern Spiny Softshell Turtle (Apalone spinifers) in Northern Lake Champlain, Qu\xe9bec, Vermont. Journal of Herpetology 36(3), 402-411.
##           realm thermoregulation locomotion trophic.guild dimension
## 1       aquatic        ectotherm   swimming     carnivore        3D
## 2       aquatic        ectotherm   swimming     carnivore        2D
## 3       aquatic        ectotherm   swimming     carnivore        2D
## 4       aquatic        ectotherm   swimming     carnivore        2D
## 5       aquatic        ectotherm   swimming     carnivore        2D
## 6       aquatic        ectotherm   swimming     carnivore        2D
## 7       aquatic        ectotherm   swimming     carnivore        2D
## 8       aquatic        ectotherm   swimming     carnivore        2D
## 9       aquatic        ectotherm   swimming     herbivore        2D
## 10      aquatic        ectotherm   swimming     herbivore        2D
## 11      aquatic        ectotherm   swimming     herbivore        2D
## 12      aquatic        ectotherm   swimming     herbivore        2D
## 13      aquatic        ectotherm   swimming     carnivore        2D
## 14      aquatic        ectotherm   swimming     carnivore        3D
## 15      aquatic        ectotherm   swimming     carnivore        3D
## 16      aquatic        ectotherm   swimming     carnivore        3D
## 17      aquatic        ectotherm   swimming     carnivore        2D
## 18      aquatic        ectotherm   swimming     carnivore        2D
## 19      aquatic        ectotherm   swimming     carnivore        3D
## 20      aquatic        ectotherm   swimming     carnivore        3D
## 21      aquatic        ectotherm   swimming     carnivore        2D
## 22      aquatic        ectotherm   swimming     carnivore        2D
## 23      aquatic        ectotherm   swimming     carnivore        2D
## 24      aquatic        ectotherm   swimming     carnivore        2D
## 25      aquatic        ectotherm   swimming     carnivore        2D
## 26      aquatic        ectotherm   swimming     carnivore        2D
## 27      aquatic        ectotherm   swimming     carnivore        2D
## 28      aquatic        ectotherm   swimming     carnivore        2D
## 29      aquatic        ectotherm   swimming     carnivore        2D
## 30      aquatic        ectotherm   swimming     carnivore        2D
## 31      aquatic        ectotherm   swimming     carnivore        2D
## 32      aquatic        ectotherm   swimming     carnivore        2D
## 33      aquatic        ectotherm   swimming     carnivore        2D
## 34      aquatic        ectotherm   swimming     carnivore        2D
## 35      aquatic        ectotherm   swimming     herbivore        2D
## 36      aquatic        ectotherm   swimming     carnivore        2D
## 37      aquatic        ectotherm   swimming     carnivore        2D
## 38      aquatic        ectotherm   swimming     carnivore        2D
## 39      aquatic        ectotherm   swimming     carnivore        2D
## 40      aquatic        ectotherm   swimming     carnivore        2D
## 41      aquatic        ectotherm   swimming     carnivore        2D
## 42      aquatic        ectotherm   swimming     carnivore        2D
## 43      aquatic        ectotherm   swimming     carnivore        2D
## 44      aquatic        ectotherm   swimming     carnivore        2D
## 45      aquatic        ectotherm   swimming     carnivore        2D
## 46      aquatic        ectotherm   swimming     carnivore        2D
## 47      aquatic        ectotherm   swimming     carnivore        2D
## 48      aquatic        ectotherm   swimming     carnivore        2D
## 49      aquatic        ectotherm   swimming     carnivore        2D
## 50      aquatic        ectotherm   swimming     carnivore        2D
## 51      aquatic        ectotherm   swimming     carnivore        2D
## 52      aquatic        ectotherm   swimming     carnivore        2D
## 53      aquatic        ectotherm   swimming     carnivore        2D
## 54      aquatic        ectotherm   swimming     carnivore        2D
## 55      aquatic        ectotherm   swimming     carnivore        2D
## 56      aquatic        ectotherm   swimming     carnivore        2D
## 57      aquatic        ectotherm   swimming     carnivore        2D
## 58      aquatic        ectotherm   swimming     carnivore        2D
## 59      aquatic        ectotherm   swimming     carnivore        2D
## 60      aquatic        ectotherm   swimming     carnivore        3D
## 61      aquatic        ectotherm   swimming     carnivore        2D
## 62      aquatic        ectotherm   swimming     herbivore        2D
## 63      aquatic        ectotherm   swimming     herbivore        2D
## 64      aquatic        ectotherm   swimming     herbivore        2D
## 65      aquatic        ectotherm   swimming     carnivore        2D
## 66      aquatic        ectotherm   swimming     herbivore        2D
## 67      aquatic        ectotherm   swimming     herbivore        2D
## 68      aquatic        ectotherm   swimming     herbivore        2D
## 69      aquatic        ectotherm   swimming     herbivore        2D
## 70      aquatic        ectotherm   swimming     herbivore        2D
## 71      aquatic        ectotherm   swimming     herbivore        2D
## 72      aquatic        ectotherm   swimming     herbivore        2D
## 73      aquatic        ectotherm   swimming     herbivore        2D
## 74      aquatic        ectotherm   swimming     herbivore        2D
## 75      aquatic        ectotherm   swimming     herbivore        2D
## 76      aquatic        ectotherm   swimming     herbivore        2D
## 77      aquatic        ectotherm   swimming     carnivore        2D
## 78      aquatic        ectotherm   swimming     carnivore        2D
## 79      aquatic        ectotherm   swimming     carnivore        2D
## 80      aquatic        ectotherm   swimming     carnivore        2D
## 81      aquatic        ectotherm   swimming     carnivore        2D
## 82      aquatic        ectotherm   swimming     carnivore        2D
## 83      aquatic        ectotherm   swimming     carnivore        2D
## 84      aquatic        ectotherm   swimming     carnivore        2D
## 85      aquatic        ectotherm   swimming     carnivore        2D
## 86      aquatic        ectotherm   swimming     carnivore        2D
## 87      aquatic        ectotherm   swimming     carnivore        2D
## 88      aquatic        ectotherm   swimming     carnivore        2D
## 89      aquatic        ectotherm   swimming     carnivore        2D
## 90      aquatic        ectotherm   swimming     carnivore        2D
## 91      aquatic        ectotherm   swimming     carnivore        2D
## 92      aquatic        ectotherm   swimming     carnivore        2D
## 93      aquatic        ectotherm   swimming     carnivore        2D
## 94      aquatic        ectotherm   swimming     carnivore        2D
## 95      aquatic        ectotherm   swimming     herbivore        2D
## 96      aquatic        ectotherm   swimming     carnivore        2D
## 97      aquatic        ectotherm   swimming     carnivore        2D
## 98      aquatic        ectotherm   swimming     carnivore        2D
## 99      aquatic        ectotherm   swimming     carnivore        2D
## 100     aquatic        ectotherm   swimming     carnivore        2D
## 101     aquatic        ectotherm   swimming     carnivore        3D
## 102     aquatic        ectotherm   swimming     carnivore        2D
## 103     aquatic        ectotherm   swimming     carnivore        2D
## 104     aquatic        ectotherm   swimming     carnivore        2D
## 105     aquatic        ectotherm   swimming     carnivore        2D
## 106     aquatic        ectotherm   swimming     carnivore        2D
## 107     aquatic        ectotherm   swimming     carnivore        2D
## 108     aquatic        ectotherm   swimming     carnivore        2D
## 109     aquatic        ectotherm   swimming     carnivore        2D
## 110     aquatic        ectotherm   swimming     carnivore        3D
## 111     aquatic        ectotherm   swimming     carnivore        2D
## 112     aquatic        ectotherm   swimming     carnivore        2D
## 113     aquatic        ectotherm   swimming     carnivore        2D
## 114 terrestrial        endotherm     flying     carnivore        3D
## 115 terrestrial        endotherm     flying     carnivore        3D
## 116 terrestrial        endotherm     flying     carnivore        3D
## 117 terrestrial        endotherm     flying     carnivore        3D
## 118 terrestrial        endotherm     flying     carnivore        3D
## 119 terrestrial        endotherm     flying     carnivore        3D
## 120 terrestrial        endotherm    walking     herbivore        2D
## 121 terrestrial        endotherm    walking     carnivore        2D
## 122 terrestrial        endotherm     flying     carnivore        3D
## 123 terrestrial        endotherm    walking     carnivore        2D
## 124 terrestrial        endotherm     flying     herbivore        3D
## 125 terrestrial        endotherm     flying     herbivore        3D
## 126 terrestrial        endotherm     flying     herbivore        3D
## 127 terrestrial        endotherm     flying     carnivore        3D
## 128 terrestrial        endotherm     flying     carnivore        3D
## 129 terrestrial        endotherm     flying     carnivore        3D
## 130 terrestrial        endotherm     flying     carnivore        3D
## 131 terrestrial        endotherm    walking     carnivore        2D
## 132 terrestrial        endotherm    walking     carnivore        2D
## 133 terrestrial        endotherm     flying     carnivore        3D
## 134 terrestrial        endotherm     flying     carnivore        3D
## 135 terrestrial        endotherm     flying     carnivore        3D
## 136 terrestrial        endotherm     flying     carnivore        3D
## 137 terrestrial        endotherm     flying     carnivore        3D
## 138 terrestrial        endotherm     flying     carnivore        3D
## 139 terrestrial        endotherm     flying     carnivore        3D
## 140 terrestrial        endotherm     flying     carnivore        3D
## 141 terrestrial        endotherm     flying     carnivore        3D
## 142 terrestrial        endotherm     flying     carnivore        3D
## 143 terrestrial        endotherm    walking     carnivore        2D
## 144 terrestrial        endotherm    walking     carnivore        2D
## 145 terrestrial        endotherm     flying     carnivore        3D
## 146 terrestrial        endotherm     flying     carnivore        3D
## 147 terrestrial        endotherm     flying     carnivore        3D
## 148 terrestrial        endotherm     flying     carnivore        3D
## 149 terrestrial        endotherm     flying     carnivore        3D
## 150 terrestrial        endotherm    walking     herbivore        2D
## 151 terrestrial        endotherm    walking     herbivore        2D
## 152 terrestrial        endotherm    walking     herbivore        2D
## 153 terrestrial        endotherm    walking     herbivore        2D
## 154 terrestrial        endotherm    walking     herbivore        2D
## 155 terrestrial        endotherm    walking     herbivore        2D
## 156 terrestrial        endotherm    walking     herbivore        2D
## 157 terrestrial        endotherm    walking     herbivore        2D
## 158 terrestrial        endotherm    walking     carnivore        2D
## 159 terrestrial        endotherm    walking     herbivore        2D
## 160 terrestrial        endotherm    walking     carnivore        2D
## 161 terrestrial        endotherm     flying     carnivore        3D
## 162 terrestrial        endotherm     flying     carnivore        3D
## 163 terrestrial        endotherm     flying     carnivore        3D
## 164 terrestrial        endotherm     flying     carnivore        3D
## 165 terrestrial        endotherm     flying     carnivore        3D
## 166 terrestrial        endotherm     flying     carnivore        3D
## 167 terrestrial        endotherm     flying     carnivore        3D
## 168 terrestrial        endotherm     flying     carnivore        3D
## 169 terrestrial        endotherm     flying     herbivore        3D
## 170 terrestrial        endotherm     flying     herbivore        3D
## 171 terrestrial        endotherm     flying     carnivore        3D
## 172 terrestrial        endotherm     flying     carnivore        3D
## 173 terrestrial        endotherm     flying     herbivore        3D
## 174 terrestrial        endotherm     flying     herbivore        3D
## 175 terrestrial        endotherm     flying     carnivore        3D
## 176 terrestrial        endotherm     flying     carnivore        3D
## 177 terrestrial        endotherm     flying     herbivore        3D
## 178 terrestrial        endotherm     flying     carnivore        3D
## 179 terrestrial        endotherm     flying     carnivore        3D
## 180 terrestrial        endotherm     flying     carnivore        3D
## 181 terrestrial        endotherm     flying     carnivore        3D
## 182 terrestrial        endotherm     flying     carnivore        3D
## 183 terrestrial        endotherm     flying     carnivore        3D
## 184 terrestrial        endotherm     flying     carnivore        3D
## 185 terrestrial        endotherm     flying     carnivore        3D
## 186 terrestrial        endotherm     flying     carnivore        3D
## 187 terrestrial        endotherm     flying     carnivore        3D
## 188 terrestrial        endotherm     flying     carnivore        3D
## 189 terrestrial        endotherm     flying     carnivore        3D
## 190 terrestrial        endotherm     flying     carnivore        3D
## 191 terrestrial        endotherm     flying     carnivore        3D
## 192 terrestrial        endotherm     flying     carnivore        3D
## 193 terrestrial        endotherm     flying     carnivore        3D
## 194 terrestrial        endotherm     flying     carnivore        3D
## 195 terrestrial        endotherm     flying     carnivore        3D
## 196 terrestrial        endotherm     flying     carnivore        3D
## 197 terrestrial        endotherm     flying     carnivore        3D
## 198 terrestrial        endotherm     flying     carnivore        3D
## 199 terrestrial        endotherm     flying     carnivore        3D
## 200 terrestrial        endotherm     flying     carnivore        3D
## 201 terrestrial        endotherm     flying     carnivore        3D
## 202 terrestrial        endotherm     flying     carnivore        3D
## 203 terrestrial        endotherm     flying     carnivore        3D
## 204 terrestrial        endotherm     flying     carnivore        3D
## 205 terrestrial        endotherm     flying     carnivore        3D
## 206 terrestrial        endotherm     flying     carnivore        3D
## 207 terrestrial        endotherm     flying     carnivore        3D
## 208 terrestrial        endotherm     flying     carnivore        3D
## 209 terrestrial        endotherm     flying     carnivore        3D
## 210 terrestrial        endotherm     flying     carnivore        3D
## 211 terrestrial        endotherm    walking     herbivore        3D
## 212 terrestrial        endotherm     flying     carnivore        3D
## 213 terrestrial        endotherm     flying     carnivore        3D
## 214 terrestrial        endotherm     flying     carnivore        3D
## 215 terrestrial        endotherm     flying     carnivore        3D
## 216 terrestrial        endotherm     flying     carnivore        3D
## 217 terrestrial        endotherm     flying     carnivore        3D
## 218 terrestrial        endotherm     flying     carnivore        3D
## 219 terrestrial        endotherm     flying     carnivore        3D
## 220 terrestrial        endotherm     flying     carnivore        3D
## 221 terrestrial        endotherm     flying     carnivore        3D
## 222 terrestrial        endotherm     flying     carnivore        3D
## 223 terrestrial        endotherm     flying     carnivore        3D
## 224 terrestrial        endotherm     flying     carnivore        3D
## 225 terrestrial        endotherm     flying     carnivore        3D
## 226 terrestrial        endotherm     flying     carnivore        3D
## 227 terrestrial        endotherm     flying     carnivore        3D
## 228 terrestrial        endotherm     flying     carnivore        3D
## 229 terrestrial        endotherm     flying     carnivore        3D
## 230 terrestrial        endotherm     flying     carnivore        3D
## 231 terrestrial        endotherm    walking     carnivore        2D
## 232 terrestrial        endotherm    walking     carnivore        2D
## 233 terrestrial        endotherm     flying     carnivore        3D
## 234 terrestrial        endotherm     flying     carnivore        3D
## 235 terrestrial        endotherm     flying     carnivore        3D
## 236 terrestrial        endotherm     flying     carnivore        3D
## 237 terrestrial        endotherm     flying     carnivore        3D
## 238 terrestrial        endotherm     flying     carnivore        3D
## 239 terrestrial        endotherm     flying     carnivore        3D
## 240 terrestrial        endotherm    walking     herbivore        2D
## 241 terrestrial        endotherm    walking     herbivore        2D
## 242 terrestrial        endotherm    walking     herbivore        2D
## 243 terrestrial        endotherm     flying     carnivore        3D
## 244 terrestrial        endotherm     flying     carnivore        3D
## 245 terrestrial        endotherm     flying     carnivore        3D
## 246 terrestrial        endotherm     flying     carnivore        3D
## 247 terrestrial        endotherm     flying     carnivore        3D
## 248 terrestrial        endotherm     flying     carnivore        3D
## 249 terrestrial        endotherm     flying     carnivore        3D
## 250 terrestrial        endotherm     flying     carnivore        3D
## 251 terrestrial        endotherm     flying     carnivore        3D
## 252 terrestrial        endotherm    walking     herbivore        2D
## 253 terrestrial        endotherm    walking     herbivore        2D
## 254 terrestrial        endotherm    walking     carnivore        2D
## 255 terrestrial        endotherm    walking     carnivore        2D
## 256 terrestrial        endotherm    walking     herbivore        2D
## 257 terrestrial        endotherm    walking     herbivore        2D
## 258 terrestrial        endotherm    walking     herbivore        2D
## 259 terrestrial        endotherm    walking     herbivore        2D
## 260 terrestrial        endotherm    walking     herbivore        2D
## 261 terrestrial        endotherm    walking     herbivore        2D
## 262 terrestrial        endotherm    walking     herbivore        2D
## 263 terrestrial        endotherm    walking     herbivore        2D
## 264 terrestrial        endotherm    walking     herbivore        2D
## 265 terrestrial        endotherm    walking     herbivore        2D
## 266 terrestrial        endotherm    walking     herbivore        2D
## 267 terrestrial        endotherm    walking     herbivore        2D
## 268 terrestrial        endotherm    walking     herbivore        2D
## 269 terrestrial        endotherm    walking     herbivore        2D
## 270 terrestrial        endotherm    walking     herbivore        2D
## 271 terrestrial        endotherm    walking     herbivore        2D
## 272 terrestrial        endotherm    walking     herbivore        2D
## 273 terrestrial        endotherm    walking     herbivore        2D
## 274 terrestrial        endotherm    walking     herbivore        2D
## 275 terrestrial        endotherm    walking     herbivore        2D
## 276 terrestrial        endotherm    walking     herbivore        2D
## 277 terrestrial        endotherm    walking     herbivore        2D
## 278 terrestrial        endotherm    walking     herbivore        2D
## 279 terrestrial        endotherm    walking     herbivore        2D
## 280 terrestrial        endotherm    walking     herbivore        2D
## 281 terrestrial        endotherm    walking     herbivore        2D
## 282 terrestrial        endotherm    walking     herbivore        2D
## 283 terrestrial        endotherm    walking     herbivore        2D
## 284 terrestrial        endotherm    walking     herbivore        2D
## 285 terrestrial        endotherm    walking     herbivore        2D
## 286 terrestrial        endotherm    walking     herbivore        2D
## 287 terrestrial        endotherm    walking     herbivore        2D
## 288 terrestrial        endotherm    walking     herbivore        2D
## 289 terrestrial        endotherm    walking     herbivore        2D
## 290 terrestrial        endotherm    walking     herbivore        2D
## 291 terrestrial        endotherm    walking     herbivore        2D
## 292 terrestrial        endotherm    walking     herbivore        2D
## 293 terrestrial        endotherm    walking     herbivore        2D
## 294 terrestrial        endotherm    walking     herbivore        2D
## 295 terrestrial        endotherm    walking     herbivore        2D
## 296 terrestrial        endotherm    walking     carnivore        2D
## 297 terrestrial        endotherm    walking     carnivore        2D
## 298 terrestrial        endotherm    walking     carnivore        2D
## 299 terrestrial        endotherm    walking     carnivore        2D
## 300 terrestrial        endotherm    walking     carnivore        2D
## 301 terrestrial        endotherm    walking     carnivore        2D
## 302 terrestrial        endotherm    walking     carnivore        2D
## 303 terrestrial        endotherm    walking     herbivore        2D
## 304 terrestrial        endotherm    walking     carnivore        2D
## 305 terrestrial        endotherm    walking     carnivore        2D
## 306 terrestrial        endotherm    walking     carnivore        2D
## 307 terrestrial        endotherm    walking     carnivore        2D
## 308 terrestrial        endotherm    walking     carnivore        2D
## 309 terrestrial        endotherm    walking     carnivore        2D
## 310 terrestrial        endotherm    walking     carnivore        2D
## 311 terrestrial        endotherm    walking     carnivore        2D
## 312 terrestrial        endotherm    walking     carnivore        2D
## 313 terrestrial        endotherm    walking     carnivore        2D
## 314 terrestrial        endotherm    walking     carnivore        2D
## 315 terrestrial        endotherm    walking     carnivore        2D
## 316 terrestrial        endotherm    walking     carnivore        2D
## 317 terrestrial        endotherm    walking     carnivore        2D
## 318 terrestrial        endotherm    walking     carnivore        2D
## 319 terrestrial        endotherm    walking     carnivore        2D
## 320 terrestrial        endotherm    walking     carnivore        2D
## 321 terrestrial        endotherm    walking     carnivore        2D
## 322 terrestrial        endotherm    walking     carnivore        2D
## 323 terrestrial        endotherm    walking     carnivore        2D
## 324 terrestrial        endotherm    walking     carnivore        2D
## 325 terrestrial        endotherm    walking     carnivore        2D
## 326 terrestrial        endotherm    walking     carnivore        2D
## 327 terrestrial        endotherm    walking     carnivore        2D
## 328 terrestrial        endotherm    walking     carnivore        2D
## 329 terrestrial        endotherm    walking     carnivore        2D
## 330 terrestrial        endotherm    walking     carnivore        2D
## 331 terrestrial        endotherm    walking     carnivore        2D
## 332 terrestrial        endotherm    walking     carnivore        2D
## 333 terrestrial        endotherm    walking     carnivore        2D
## 334 terrestrial        endotherm    walking     carnivore        2D
## 335 terrestrial        endotherm    walking     carnivore        2D
## 336 terrestrial        endotherm    walking     carnivore        2D
## 337 terrestrial        endotherm    walking     carnivore        2D
## 338 terrestrial        endotherm    walking     carnivore        2D
## 339 terrestrial        endotherm    walking     carnivore        2D
## 340 terrestrial        endotherm    walking     carnivore        2D
## 341 terrestrial        endotherm    walking     carnivore        2D
## 342 terrestrial        endotherm    walking     carnivore        2D
## 343 terrestrial        endotherm    walking     carnivore        2D
## 344 terrestrial        endotherm    walking     carnivore        2D
## 345 terrestrial        endotherm    walking     herbivore        2D
## 346 terrestrial        endotherm    walking     herbivore        2D
## 347 terrestrial        endotherm    walking     carnivore        2D
## 348 terrestrial        endotherm    walking     carnivore        2D
## 349 terrestrial        endotherm    walking     carnivore        2D
## 350 terrestrial        endotherm    walking     carnivore        2D
## 351 terrestrial        endotherm    walking     carnivore        2D
## 352 terrestrial        endotherm    walking     carnivore        2D
## 353 terrestrial        endotherm    walking     carnivore        2D
## 354 terrestrial        endotherm    walking     carnivore        2D
## 355 terrestrial        endotherm    walking     carnivore        2D
## 356 terrestrial        endotherm    walking     carnivore        2D
## 357 terrestrial        endotherm    walking     herbivore        2D
## 358 terrestrial        endotherm    walking     herbivore        2D
## 359 terrestrial        endotherm    walking     herbivore        2D
## 360 terrestrial        endotherm    walking     herbivore        2D
## 361 terrestrial        endotherm    walking     herbivore        2D
## 362 terrestrial        endotherm    walking     herbivore        2D
## 363 terrestrial        endotherm    walking     herbivore        2D
## 364 terrestrial        endotherm    walking     herbivore        2D
## 365 terrestrial        endotherm    walking     herbivore        2D
## 366 terrestrial        endotherm    walking     herbivore        2D
## 367 terrestrial        endotherm    walking     herbivore        2D
## 368 terrestrial        endotherm    walking     herbivore        2D
## 369 terrestrial        endotherm    walking     herbivore        2D
## 370 terrestrial        endotherm    walking     herbivore        2D
## 371 terrestrial        endotherm    walking     herbivore        2D
## 372 terrestrial        endotherm    walking     herbivore        2D
## 373 terrestrial        endotherm    walking     herbivore        2D
## 374 terrestrial        endotherm    walking     herbivore        2D
## 375 terrestrial        endotherm    walking     herbivore        2D
## 376 terrestrial        endotherm    walking     carnivore        2D
## 377 terrestrial        endotherm    walking     carnivore        2D
## 378 terrestrial        endotherm    walking     herbivore        2D
## 379 terrestrial        endotherm    walking     herbivore        2D
## 380 terrestrial        endotherm    walking     herbivore        2D
## 381 terrestrial        endotherm    walking     herbivore        2D
## 382 terrestrial        endotherm    walking     herbivore        2D
## 383 terrestrial        endotherm    walking     herbivore        2D
## 384 terrestrial        endotherm    walking     herbivore        2D
## 385 terrestrial        endotherm    walking     herbivore        2D
## 386 terrestrial        endotherm    walking     herbivore        2D
## 387 terrestrial        endotherm    walking     herbivore        2D
## 388 terrestrial        endotherm    walking     herbivore        2D
## 389 terrestrial        endotherm    walking     herbivore        2D
## 390 terrestrial        endotherm    walking     herbivore        2D
## 391 terrestrial        endotherm    walking     herbivore        2D
## 392 terrestrial        endotherm    walking     carnivore        2D
## 393 terrestrial        endotherm    walking     carnivore        2D
## 394 terrestrial        endotherm    walking     carnivore        2D
## 395 terrestrial        endotherm    walking     carnivore        2D
## 396 terrestrial        endotherm    walking     carnivore        2D
## 397 terrestrial        endotherm    walking     carnivore        2D
## 398 terrestrial        endotherm    walking     herbivore        2D
## 399 terrestrial        endotherm    walking     herbivore        2D
## 400 terrestrial        endotherm    walking     herbivore        2D
## 401 terrestrial        endotherm    walking     herbivore        2D
## 402 terrestrial        endotherm    walking     herbivore        2D
## 403 terrestrial        endotherm    walking     herbivore        2D
## 404 terrestrial        endotherm    walking     carnivore        2D
## 405 terrestrial        endotherm    walking     herbivore        2D
## 406 terrestrial        endotherm    walking     herbivore        2D
## 407 terrestrial        endotherm    walking     herbivore        2D
## 408 terrestrial        endotherm    walking     herbivore        2D
## 409 terrestrial        endotherm    walking     herbivore        2D
## 410 terrestrial        endotherm    walking     herbivore        2D
## 411 terrestrial        endotherm    walking     herbivore        2D
## 412 terrestrial        endotherm    walking     herbivore        2D
## 413 terrestrial        endotherm    walking     herbivore        2D
## 414 terrestrial        endotherm    walking     herbivore        2D
## 415 terrestrial        endotherm    walking     herbivore        2D
## 416 terrestrial        endotherm    walking     herbivore        2D
## 417 terrestrial        endotherm    walking     herbivore        2D
## 418 terrestrial        endotherm    walking     herbivore        2D
## 419 terrestrial        endotherm    walking     herbivore        2D
## 420 terrestrial        endotherm    walking     herbivore        2D
## 421 terrestrial        endotherm    walking     herbivore        2D
## 422 terrestrial        endotherm    walking     herbivore        2D
## 423 terrestrial        endotherm    walking     herbivore        2D
## 424 terrestrial        endotherm    walking     herbivore        2D
## 425 terrestrial        endotherm    walking     herbivore        2D
## 426 terrestrial        endotherm    walking     herbivore        2D
## 427 terrestrial        endotherm    walking     herbivore        2D
## 428 terrestrial        endotherm    walking     herbivore        2D
## 429 terrestrial        endotherm    walking     herbivore        2D
## 430 terrestrial        endotherm    walking     carnivore        2D
## 431 terrestrial        endotherm    walking     herbivore        2D
## 432 terrestrial        endotherm    walking     herbivore        2D
## 433 terrestrial        endotherm    walking     herbivore        2D
## 434 terrestrial        endotherm    walking     herbivore        2D
## 435 terrestrial        endotherm    walking     herbivore        2D
## 436 terrestrial        endotherm    walking     herbivore        2D
## 437 terrestrial        endotherm    walking     herbivore        2D
## 438 terrestrial        endotherm    walking     herbivore        2D
## 439 terrestrial        endotherm    walking     herbivore        2D
## 440 terrestrial        endotherm    walking     herbivore        2D
## 441 terrestrial        endotherm    walking     herbivore        2D
## 442 terrestrial        endotherm    walking     herbivore        2D
## 443 terrestrial        endotherm    walking     herbivore        2D
## 444 terrestrial        endotherm    walking     herbivore        2D
## 445 terrestrial        endotherm    walking     herbivore        2D
## 446 terrestrial        endotherm    walking     herbivore        2D
## 447 terrestrial        endotherm    walking     herbivore        2D
## 448 terrestrial        endotherm    walking     herbivore        2D
## 449 terrestrial        endotherm    walking     herbivore        2D
## 450 terrestrial        endotherm    walking     herbivore        2D
## 451 terrestrial        endotherm    walking     herbivore        2D
## 452 terrestrial        endotherm    walking     herbivore        2D
## 453 terrestrial        endotherm    walking     herbivore        2D
## 454 terrestrial        endotherm    walking     herbivore        2D
## 455 terrestrial        endotherm    walking     herbivore        2D
## 456 terrestrial        endotherm    walking     herbivore        2D
## 457 terrestrial        endotherm    walking     herbivore        2D
## 458 terrestrial        endotherm    walking     herbivore        2D
## 459 terrestrial        endotherm    walking     herbivore        2D
## 460 terrestrial        endotherm    walking     herbivore        2D
## 461 terrestrial        endotherm    walking     herbivore        2D
## 462 terrestrial        endotherm    walking     herbivore        2D
## 463 terrestrial        endotherm    walking     herbivore        2D
## 464 terrestrial        endotherm    walking     herbivore        2D
## 465 terrestrial        endotherm    walking     herbivore        2D
## 466 terrestrial        endotherm    walking     herbivore        2D
## 467 terrestrial        endotherm    walking     herbivore        2D
## 468 terrestrial        endotherm    walking     herbivore        2D
## 469 terrestrial        endotherm    walking     herbivore        2D
## 470 terrestrial        endotherm    walking     herbivore        2D
## 471 terrestrial        endotherm    walking     herbivore        2D
## 472 terrestrial        endotherm    walking     herbivore        2D
## 473 terrestrial        endotherm    walking     herbivore        2D
## 474 terrestrial        endotherm    walking     herbivore        2D
## 475 terrestrial        endotherm    walking     herbivore        2D
## 476 terrestrial        endotherm    walking     herbivore        2D
## 477 terrestrial        endotherm    walking     herbivore        2D
## 478 terrestrial        endotherm    walking     herbivore        2D
## 479 terrestrial        endotherm    walking     herbivore        2D
## 480 terrestrial        endotherm    walking     herbivore        2D
## 481 terrestrial        endotherm    walking     herbivore        2D
## 482 terrestrial        endotherm    walking     carnivore        2D
## 483 terrestrial        endotherm    walking     carnivore        2D
## 484 terrestrial        endotherm    walking     carnivore        2D
## 485 terrestrial        endotherm    walking     carnivore        2D
## 486 terrestrial        endotherm    walking     carnivore        2D
## 487 terrestrial        endotherm    walking     carnivore        2D
## 488 terrestrial        endotherm    walking     carnivore        2D
## 489 terrestrial        endotherm    walking     carnivore        2D
## 490 terrestrial        endotherm    walking     carnivore        2D
## 491 terrestrial        endotherm    walking     carnivore        2D
## 492 terrestrial        ectotherm    walking     herbivore        2D
## 493 terrestrial        ectotherm   crawling     carnivore        2D
## 494 terrestrial        ectotherm   crawling     carnivore        2D
## 495 terrestrial        ectotherm   crawling     carnivore        2D
## 496 terrestrial        ectotherm   crawling     carnivore        2D
## 497 terrestrial        ectotherm   crawling     carnivore        2D
## 498 terrestrial        ectotherm   crawling     carnivore        2D
## 499 terrestrial        ectotherm   crawling     carnivore        2D
## 500 terrestrial        ectotherm   crawling     carnivore        2D
## 501 terrestrial        ectotherm   crawling     carnivore        2D
## 502 terrestrial        ectotherm   crawling     carnivore        2D
## 503 terrestrial        ectotherm   crawling     carnivore        2D
## 504 terrestrial        ectotherm   crawling     carnivore        2D
## 505 terrestrial        ectotherm   crawling     carnivore        2D
## 506 terrestrial        ectotherm   crawling     carnivore        2D
## 507 terrestrial        ectotherm   crawling     carnivore        2D
## 508 terrestrial        ectotherm   crawling     carnivore        2D
## 509 terrestrial        ectotherm   crawling     carnivore        2D
## 510 terrestrial        ectotherm   crawling     carnivore        2D
## 511 terrestrial        ectotherm   crawling     carnivore        2D
## 512 terrestrial        ectotherm   crawling     carnivore        2D
## 513 terrestrial        ectotherm   crawling     carnivore        2D
## 514 terrestrial        ectotherm    walking     carnivore        2D
## 515 terrestrial        ectotherm   crawling     carnivore        2D
## 516 terrestrial        ectotherm   crawling     carnivore        2D
## 517 terrestrial        ectotherm   crawling     carnivore        2D
## 518 terrestrial        ectotherm    walking     herbivore        2D
## 519 terrestrial        ectotherm    walking     herbivore        2D
## 520 terrestrial        ectotherm    walking     herbivore        2D
## 521 terrestrial        ectotherm    walking     herbivore        2D
## 522 terrestrial        ectotherm    walking     herbivore        2D
## 523 terrestrial        ectotherm    walking     herbivore        2D
## 524 terrestrial        ectotherm    walking     herbivore        2D
## 525 terrestrial        ectotherm    walking     herbivore        2D
## 526 terrestrial        ectotherm    walking     herbivore        2D
## 527 terrestrial        ectotherm   crawling     carnivore        2D
## 528 terrestrial        ectotherm    walking     herbivore        2D
## 529 terrestrial        ectotherm   crawling     carnivore        2D
## 530 terrestrial        ectotherm   crawling     carnivore        2D
## 531 terrestrial        ectotherm   crawling     carnivore        2D
## 532 terrestrial        ectotherm   crawling     carnivore        2D
## 533 terrestrial        ectotherm   crawling     carnivore        2D
## 534 terrestrial        ectotherm   crawling     carnivore        2D
## 535 terrestrial        ectotherm   crawling     carnivore        2D
## 536 terrestrial        ectotherm   crawling     carnivore        2D
## 537 terrestrial        ectotherm   crawling     carnivore        2D
## 538 terrestrial        ectotherm   crawling     carnivore        2D
## 539 terrestrial        ectotherm   crawling     carnivore        2D
## 540 terrestrial        ectotherm   crawling     carnivore        2D
## 541 terrestrial        ectotherm   crawling     carnivore        2D
## 542 terrestrial        ectotherm   crawling     carnivore        2D
## 543 terrestrial        ectotherm   crawling     carnivore        2D
## 544 terrestrial        ectotherm    walking     carnivore        2D
## 545 terrestrial        ectotherm    walking     carnivore        2D
## 546 terrestrial        ectotherm    walking     carnivore        2D
## 547 terrestrial        ectotherm    walking     carnivore        2D
## 548 terrestrial        ectotherm    walking     carnivore        2D
## 549 terrestrial        ectotherm    walking     carnivore        2D
## 550 terrestrial        ectotherm    walking     carnivore        2D
## 551 terrestrial        ectotherm    walking     carnivore        2D
## 552 terrestrial        ectotherm    walking     herbivore        2D
## 553 terrestrial        ectotherm    walking     herbivore        2D
## 554 terrestrial        ectotherm    walking     carnivore        2D
## 555 terrestrial        ectotherm    walking     carnivore        2D
## 556 terrestrial        ectotherm    walking     carnivore        2D
## 557 terrestrial        ectotherm    walking     herbivore        2D
## 558 terrestrial        ectotherm    walking     herbivore        2D
## 559 terrestrial        ectotherm    walking     herbivore        2D
## 560 terrestrial        ectotherm    walking     herbivore        2D
## 561 terrestrial        ectotherm    walking     herbivore        2D
## 562 terrestrial        ectotherm    walking     herbivore        2D
## 563 terrestrial        ectotherm    walking     herbivore        2D
## 564 terrestrial        ectotherm    walking     herbivore        2D
## 565 terrestrial        ectotherm    walking     herbivore        2D
## 566 terrestrial        ectotherm    walking     herbivore        2D
## 567 terrestrial        ectotherm    walking     herbivore        2D
## 568 terrestrial        ectotherm    walking     herbivore        2D
## 569 terrestrial        ectotherm    walking     carnivore        2D
##                                                                                                                                                                                                                                                                                prey.size.reference
## 1                                                                                                                                                                                                                                                                                             <NA>
## 2                                                                                                                                                                                                                                                                                             <NA>
## 3                                                                                                                                                                                                                                                                                             <NA>
## 4                                                                                                                                                                                                                                                                                             <NA>
## 5                                                                                                                                                                                                                                                                                             <NA>
## 6                                                                                                                                                                                                                                                                                             <NA>
## 7                                                                                                                                                                                                            Brose U, et al. 2005b. Body sizes of consumers and their resources. Ecology 86, 2545.
## 8                                                                                                                                                                                                                                                                                             <NA>
## 9                                                                                                                                                                                                                                                                                             <NA>
## 10                                                                                                                                                                                                                                                                                            <NA>
## 11                                                                                                                                                                                                                                                                                            <NA>
## 12                                                                                                                                                                                                                                                                                            <NA>
## 13                                                                                                                                                                                                                                                                                            <NA>
## 14                                                                                                                                                                                                                                                                                            <NA>
## 15                                                                                                                                                                                                                                                                                            <NA>
## 16                                                                                                                                                                                                                                                                                            <NA>
## 17                                                                                                                                                                                                                                                                                            <NA>
## 18                                                                                                                                                                                                                                                                                            <NA>
## 19                                                                                                                                                                                                                                                                                            <NA>
## 20                                                                                                                                                                                                                                                                                            <NA>
## 21                                                                                                                                                                                                                                                                                            <NA>
## 22                                                                                                                                                                                                                                                                                            <NA>
## 23                                                                                                                                                                                                                                                                                            <NA>
## 24                                                                                                                                                                                                                                                                                            <NA>
## 25                                                                                                                                                                                                                                                                                            <NA>
## 26                                                                                                                                                                                                                                                                                            <NA>
## 27                                                                                                                                                                                                                                                                                            <NA>
## 28                                                                                                                                                                                                                                                                                            <NA>
## 29                                                                                                                                                                                                                                                                                            <NA>
## 30                                                                                                                                                                                                                                                                                            <NA>
## 31                                                                                                                                                                                                                                                                                            <NA>
## 32                                                                                                                                                                                                                                                                                            <NA>
## 33                                                                                                                                                                                                                                                                                            <NA>
## 34                                                                                                                                                                                                                                                                                            <NA>
## 35                                                                                                                                                                                                                                                                                            <NA>
## 36                                                                                                                                                                                                                                                                                            <NA>
## 37                                                                                                                                                                                                                                                                                            <NA>
## 38                                                                                                                                                                                                                                                                                            <NA>
## 39                                                                                                                                                                                                                                                                                            <NA>
## 40                                                                                                                                                                                                                                                                                            <NA>
## 41                                                                                                                                                                                                                                                                                            <NA>
## 42                                                                                                                                                                                                                                                                                            <NA>
## 43                                                                                                                                                                                                                                                                                            <NA>
## 44                                                                                                                                                                                                                                                                                            <NA>
## 45                                                                                                                                                                                                                                                                                            <NA>
## 46                                                                                                                                                                                                                                                                                            <NA>
## 47                                                                                                                                                                                                                                                                                            <NA>
## 48                                                                                                                                                                                                                                                                                            <NA>
## 49                                                                                                                                                                                                                                                                                            <NA>
## 50                                                                                                                                                                                                                                                                                            <NA>
## 51                                                                                                                                                                                                                                                                                            <NA>
## 52                                                                                                                               Rooker JR. 1995. Feeding Ecology of the Schoolmaster Snapper Lutjanus apodus (Walbaum), From Southwestern Puerto Rico. Bulletin of Marine Science 56(3), 881-894.
## 53                                                                                                                                                                                                                                                                                            <NA>
## 54                                                                                                                                                                                                                                                                                            <NA>
## 55                                                                                                                                                                                                                                                                                            <NA>
## 56                                                                                                                                                                                                                                                                                            <NA>
## 57                                                                                                                                                                                                                                                                                            <NA>
## 58                                                                                                                                                                                                                                                                                            <NA>
## 59                                                                                                                                                                                                                                                                                            <NA>
## 60                                                                                                                                                                                                                                                                                            <NA>
## 61                                                                                                                                                                                                                                                                                            <NA>
## 62                                                                                                                                                                                                                                                                                            <NA>
## 63                                                                                                                                                                                                                                                                                            <NA>
## 64                                                                                                                                                                                                                                                                                            <NA>
## 65                                                                                                                                                                                                                                                                                            <NA>
## 66                                                                                                                                                                                                                                                                                            <NA>
## 67                                                                                                                                                                                                                                                                                            <NA>
## 68                                                                                                                                                                                                                                                                                            <NA>
## 69                                                                                                                                                                                                                                                                                            <NA>
## 70                                                                                                                                                                                                                                                                                            <NA>
## 71                                                                                                                                                                                                                                                                                            <NA>
## 72                                                                                                                                                                                                                                                                                            <NA>
## 73                                                                                                                                                                                                                                                                                            <NA>
## 74                                                                                                                                                                                                                                                                                            <NA>
## 75                                                                                                                                                                                                                                                                                            <NA>
## 76                                                                                                                                                                                                                                                                                            <NA>
## 77                                                                                                         Dierking J, Williams ID, Walsh W. 2009. Diet composition and prey selection of the introduced grouper species peacock hind (Cephalopholis argus) in Hawaii. Fish. Bull. 107:464\x96476.
## 78                                                                                                                                                                                                                                                                                            <NA>
## 79                                                                                                                                                                                                                                                                                            <NA>
## 80                                                                                                                                                                                                                                                                                            <NA>
## 81                                                                                                                                                                                                                                                                                            <NA>
## 82                                                                                                                                                   Linde M, Grau AM, Riera F, Massuti-Pascual E. 2004. Analysis of Trophic Ontogeny in Epinephelus Marginatus (Serranidae). Cybium 28(1): 27-35.
## 83                                                                                                                                                                                                                                                                                            <NA>
## 84                                                                                             Sadovy Y, Eklund A-M. 1999. Synopsis of Biological Data on the Nassau Grouper, Epinephelus striatus (Bloch, 1792), and the Jewfish, E. itajara (Lichtenstein 1822). NOAA Technical Report NMFS 146.
## 85                                                                                                                                                                                                                                                                                            <NA>
## 86                                                                                                                                                                                                                                                                                            <NA>
## 87                                                                                                                                                                                                                                                                                            <NA>
## 88                                                                                                                                                                                                                                                                                            <NA>
## 89                                                                                                                                                                                                                                                                                            <NA>
## 90                                                                                                                                                                                                                                                                                            <NA>
## 91                                                                                                                                                                                                                                                                                            <NA>
## 92                                                                                        St John J. 1999. Ontogenetic changes in the diet of the coral reef grouper Plectropomus leopardus (Serranidae): patterns in taxa, size and habitat of prey. Marine Ecology Progress Series 180, 233-246.
## 93                                                                                                                                                                                                                                                                                            <NA>
## 94                                                                                                                                                                                                                                                                                            <NA>
## 95                                                                                                                                                                                                                                                                                            <NA>
## 96                                                                                                                                                                                                                                                                                            <NA>
## 97                                                                                                                                                                                                                                                                                            <NA>
## 98                                                                                                                                                                                                                                                                                            <NA>
## 99                                                                                                                                                                                                                                                                                            <NA>
## 100                                                                                                                                                                                                                                                                                           <NA>
## 101                                                                                                                                    Hyvarinen P, Huusko A. 2006. Diet of brown trout in relation to variation in abundance and size of pelagic fish prey. Journal of Fish Biology 68, 87\x9698.
## 102                                                                                                                                                                                                                                                                                           <NA>
## 103                                                                                                                                                                                                                                                                                           <NA>
## 104                                                                                                                                                                                                                                                                                           <NA>
## 105                                                                                                         Murie DJ. 1995. Comparative feeding ecology of two sympatric rockfish congeners, Sebastes caurinus (copper rockfish) and S. maliger (quillback rockfish). Marine Biology 124: 341-353.
## 106                                                             Honda H, Masatoshi K. 1997. Size selective feeding and its limitations for the black rockfish, Sebastes inermis, in a demersal fish assemblage of Onagawa Bay, northeastern Japan. Environmental Biology of Fishes 50: 183\x96193.
## 107                                                                                                         Murie DJ. 1995. Comparative feeding ecology of two sympatric rockfish congeners, Sebastes caurinus (copper rockfish) and S. maliger (quillback rockfish). Marine Biology 124: 341-353.
## 108                                                                                                                                                                                                                                                                                           <NA>
## 109                                                                                                                                                                                                                                                                                           <NA>
## 110                                                                                                                                                                                                                                                                                           <NA>
## 111                                                                                                                                                                                                                                                                                           <NA>
## 112                                                                                                                                                                                                                                                                                           <NA>
## 113                                                                                                                                                                                                                                                                                           <NA>
## 114                                                                                                                             Gliwicz J. 2008. Body Size Relationships between Avian Predators and Their Rodent Prey in a North-American Sagebrush Community. Acta Ornithologica, 43(2):151-158.
## 115                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 116                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 117                                                                                                                                                                                                                                                                                           <NA>
## 118                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 119                                                                                                                                                                                                                                                                                           <NA>
## 120                                                                                                                                                                                                                                                                                           <NA>
## 121                                                                                                                                                                                                                                                                                           <NA>
## 122                                                                                                                                                                                                                                                                                           <NA>
## 123                                                                                                                                                                                                                                                                                           <NA>
## 124                                                                                                                                                                                                                                                                                           <NA>
## 125                                                                                                                                                                                                                                                                                           <NA>
## 126                                                                                                                                                                                                                                                                                           <NA>
## 127                                                                                                                                                                                                                                                                                           <NA>
## 128                                                                                                                                                                                                                                                                                           <NA>
## 129                                                                                                                                                                                                                                                                                           <NA>
## 130                                                                                                                                                                                                                                                                                           <NA>
## 131                                                                                                                                                                                                                                                                                           <NA>
## 132                                                                                                                                                                                                                                                                                           <NA>
## 133                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
## 134                                                                                                                                                                                                           Schoener TW. 1968. Sizes of Feeding Territories among Birds. Ecology 49(1), 123-141.
## 135                                                                                                                                                                                                                                                                                           <NA>
## 136                                                                                                                                                                                                           Schoener TW. 1968. Sizes of Feeding Territories among Birds. Ecology 49(1), 123-141.
## 137                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
## 138                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
## 139                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
## 140                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
## 141                                                                                                                                                                                                                                                                                           <NA>
## 142                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 143                                                                                                                                                                                                                                                                                           <NA>
## 144                                                                                                                                                                                                                                                                                           <NA>
## 145                                                                                                                                                                                                                                                                                           <NA>
## 146                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
## 147                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 148                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
## 149                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 150                                                                                                                                                                                                                                                                                           <NA>
## 151                                                                                                                                                                                                                                                                                           <NA>
## 152                                                                                                                                                                                                                                                                                           <NA>
## 153                                                                                                                                                                                                                                                                                           <NA>
## 154                                                                                                                                                                                                                                                                                           <NA>
## 155                                                                                                                                                                                                                                                                                           <NA>
## 156                                                                                                                                                                                                                                                                                           <NA>
## 157                                                                                                                                                                                                                                                                                           <NA>
## 158                                                                                                                                                                                                                                                                                           <NA>
## 159                                                                                                                                                                                                                                                                                           <NA>
## 160                                                                                                                                                                                                                                                                                           <NA>
## 161                                                                                                                                                                                                                                                                                           <NA>
## 162                                                                                                                                                                                                                                                                                           <NA>
## 163                                                                                                                                                                                                                                                                                           <NA>
## 164                                                                                                                                                                                                                                                                                           <NA>
## 165                                                                                                                                                                                                                                                                                           <NA>
## 166                                                                                                                                                                                                                                                                                           <NA>
## 167                                                                                                                                                                                                                                                                                           <NA>
## 168                                                                                                                                                                                                                                                                                           <NA>
## 169                                                                                                                                                                                                                                                                                           <NA>
## 170                                                                                                                                                                                                                                                                                           <NA>
## 171                                                                                                                                                                                                                                                                                           <NA>
## 172                                                                                                                                                                                                                                                                                           <NA>
## 173                                                                                                                                                                                                                                                                                           <NA>
## 174                                                                                                                                                                                                                                                                                           <NA>
## 175                                                                                                                                                                                                                                                                                           <NA>
## 176                                                                                                                                                                                                                                                                                           <NA>
## 177                                                                                                                                                                                                                                                                                           <NA>
## 178                                                                                                                                                                                                                                                                                           <NA>
## 179                                                                                                                                                                                                                                                                                           <NA>
## 180                                                                                                                                                                                                                                                                                           <NA>
## 181                                                                                                                                                                                                                                                                                           <NA>
## 182                                                                                                                                                                                                                                                                                           <NA>
## 183                                                                                                                                                                                                                                                                                           <NA>
## 184                                                                                                                                                                                                                                                                                           <NA>
## 185                                                                                                                                                                                                                                                                                           <NA>
## 186                                                                                                                                                                                                                                                                                           <NA>
## 187                                                                                                                                                                                                                                                                                           <NA>
## 188                                                                                                                                                                                                                                                                                           <NA>
## 189                                                                                                                                                                                                                                                                                           <NA>
## 190                                                                                                                                                                                                                                                                                           <NA>
## 191                                                                                                                                                                                                                                                                                           <NA>
## 192                                                                                                                                                                                                                                                                                           <NA>
## 193                                                                                                                                                                                                                                                                                           <NA>
## 194                                                                                                                                                                                                                                                                                           <NA>
## 195                                                                                                                                                                                                                                                                                           <NA>
## 196                                                                                                                                                                                                                                                                                           <NA>
## 197                                                                                                                                                                                                                                                                                           <NA>
## 198                                                                                                                                                                                                                                                                                           <NA>
## 199                                                                                                                                                                                                                                                                                           <NA>
## 200                                                                                                                                                                                                                                                                                           <NA>
## 201                                                                                                                                                                                                                                                                                           <NA>
## 202                                                                                                                                                                                                                                                                                           <NA>
## 203                                                                                                                                                                                                                                                                                           <NA>
## 204                                                                                                                                                                                                                                                                                           <NA>
## 205                                                                                                                                                                                                                                                                                           <NA>
## 206                                                                                                                                                                                                                                                                                           <NA>
## 207                                                                                                                                                                                                                                                                                           <NA>
## 208                                                                                                                                                                                                                                                                                           <NA>
## 209                                                                                                                                                                                                                                                                                           <NA>
## 210                                                                                                                                                                                                                                                                                           <NA>
## 211                                                                                                                                                                                                                                                                                           <NA>
## 212                                                                                                                                                                                                                                                                                           <NA>
## 213                                                                                                                                                                                                                                                                                           <NA>
## 214                                                                                                                                                                                                                                                                                           <NA>
## 215                                                                                                                                                                                                                                                                                           <NA>
## 216                                                                                                                                                                                                                                                                                           <NA>
## 217                                                                                                                                                                                                                                                                                           <NA>
## 218                                                                                                                                                                                                                                                                                           <NA>
## 219                                                                                                                                                                                                                                                                                           <NA>
## 220                                                                                                                                                                                                                                                                                           <NA>
## 221                                                                                                                                                                                                                                                                                           <NA>
## 222                                                                                                                                                                                                                                                                                           <NA>
## 223                                                                                                                                                                                                                                                                                           <NA>
## 224                                                                                                                                                                                                                                                                                           <NA>
## 225                                                                                                                                                                                                                                                                                           <NA>
## 226                                                                                                                                                                                                                                                                                           <NA>
## 227                                                                                                                                                                                                                                                                                           <NA>
## 228                                                                                                                                                                                                                                                                                           <NA>
## 229                                                                                                                                                                                                                                                                                           <NA>
## 230                                                                                                                                                                                                                                                                                           <NA>
## 231                                                                                                                                                                                                                                                                                           <NA>
## 232                                                                                                                                                                                                                                                                                           <NA>
## 233                                                                                                                                                                                                                                                                                           <NA>
## 234                                                                                                                                                                                                                                                                                           <NA>
## 235                                                                                                                                                                                                                                                                                           <NA>
## 236                                                                                                                                                                                                                                                                                           <NA>
## 237                                                                                                                                                                                                                                                                                           <NA>
## 238                                                                                                                                                                                                                                                                                           <NA>
## 239                                                                                                                                                                                                                                                                                           <NA>
## 240                                                                                                                                                                                                                                                                                           <NA>
## 241                                                                                                                                                                                                                                                                                           <NA>
## 242                                                                                                                                                                                                                                                                                           <NA>
## 243                                                                                                                                                                                                                                                                                           <NA>
## 244                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 245                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 246                                                                                                                                            Marchesi L, Sergio F, Pedrini P. 2002. Costs and benefits of breeding in human-altered landscapes for the Eagle Owl Bubo bubo. Ibis 144, E164-E177.
## 247                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
## 248                                                                                                                              Slagsvold T, Sonerud GA. 2007. Prey size and ingestion rate in raptors: importance for sex roles and reversed sexual size dimorphism. J. Avian Biol. 38: 650 661.
## 249                                                                                                                                                                                                                                                                                           <NA>
## 250                                                                                                                            Galeotti P, Morimando F, Violani C. 2009. Feeding ecology of the tawny owls (Strix aluco) in urban habitats (northern Italy). Bolletino di zoologia 58(2), 143-150.
## 251                                            Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, andConsequences. Oecologia 71(3), 461-472.
## 252                                                                                                                                                                                                                                                                                           <NA>
## 253                                                                                                                                                                                                                                                                                           <NA>
## 254                                                                                                                                                                                                                                                                                           <NA>
## 255                                                                                                                                                                                                                                                                                           <NA>
## 256                                                                                                                                                                                                                                                                                           <NA>
## 257                                                                                                                                                                                                                                                                                           <NA>
## 258                                                                                                                                                                                                                                                                                           <NA>
## 259                                                                                                                                                                                                                                                                                           <NA>
## 260                                                                                                                                                                                                                                                                                           <NA>
## 261                                                                                                                                                                                                                                                                                           <NA>
## 262                                                                                                                                                                                                                                                                                           <NA>
## 263                                                                                                                                                                                                                                                                                           <NA>
## 264                                                                                                                                                                                                                                                                                           <NA>
## 265                                                                                                                                                                                                                                                                                           <NA>
## 266                                                                                                                                                                                                                                                                                           <NA>
## 267                                                                                                                                                                                                                                                                                           <NA>
## 268                                                                                                                                                                                                                                                                                           <NA>
## 269                                                                                                                                                                                                                                                                                           <NA>
## 270                                                                                                                                                                                                                                                                                           <NA>
## 271                                                                                                                                                                                                                                                                                           <NA>
## 272                                                                                                                                                                                                                                                                                           <NA>
## 273                                                                                                                                                                                                                                                                                           <NA>
## 274                                                                                                                                                                                                                                                                                           <NA>
## 275                                                                                                                                                                                                                                                                                           <NA>
## 276                                                                                                                                                                                                                                                                                           <NA>
## 277                                                                                                                                                                                                                                                                                           <NA>
## 278                                                                                                                                                                                                                                                                                           <NA>
## 279                                                                                                                                                                                                                                                                                           <NA>
## 280                                                                                                                                                                                                                                                                                           <NA>
## 281                                                                                                                                                                                                                                                                                           <NA>
## 282                                                                                                                                                                                                                                                                                           <NA>
## 283                                                                                                                                                                                                                                                                                           <NA>
## 284                                                                                                                                                                                                                                                                                           <NA>
## 285                                                                                                                                                                                                                                                                                           <NA>
## 286                                                                                                                                                                                                                                                                                           <NA>
## 287                                                                                                                                                                                                                                                                                           <NA>
## 288                                                                                                                                                                                                                                                                                           <NA>
## 289                                                                                                                                                                                                                                                                                           <NA>
## 290                                                                                                                                                                                                                                                                                           <NA>
## 291                                                                                                                                                                                                                                                                                           <NA>
## 292                                                                                                                                                                                                                                                                                           <NA>
## 293                                                                                                                                                                                                                                                                                           <NA>
## 294                                                                                                                                                                                                                                                                                           <NA>
## 295                                                                                                                                                                                                                                                                                           <NA>
## 296                                                                                                                                                                                                                                                                                           <NA>
## 297                                                                                                                                                                                                                                                                                           <NA>
## 298                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 299                                                                                                                                                                                                                                                                                           <NA>
## 300                                                                                                                                                                                                                                                                                           <NA>
## 301                                                                                                                                                                                                                                                                                           <NA>
## 302                                                                                                                                                                                                                                                                                           <NA>
## 303                                                                                                                                                                                                                                                                                           <NA>
## 304                                                                                                                                                                                                                                                                                           <NA>
## 305                                                                                                                                                                                                                                                                                           <NA>
## 306                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 307                                                                                                                                                                                                                                                                                           <NA>
## 308                                                                                                                                                                                                                                                                                           <NA>
## 309                                                                                                                                                                                                                                                                                           <NA>
## 310                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 311                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 312                                                                                                                                                                                                                                                                                           <NA>
## 313                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 314                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 315                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 316                                                                                                                                                                                                                                                                                           <NA>
## 317                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 318                                                                                                                                                                                                                                                                                           <NA>
## 319                                                                                                        Radloff FG, Du Toit JT. 2004. Large predators and their prey in a southern African savanna: a predator\x92s size determines its prey size range. Journal of Animal Ecology 73, 410-423.
## 320                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 321                                                                                                                                                                                                                                                                                           <NA>
## 322                                                                                                                                                                                                                                                                                           <NA>
## 323                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 324                                                                                                                                                                                                                                                                                           <NA>
## 325                                                                                                                                                                                                                                                                                           <NA>
## 326                                                                                                                                                                                                                                                                                           <NA>
## 327                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 328                                                                                                                                                                                                                                                                                           <NA>
## 329                                                                                                                                                                                                                                                                                           <NA>
## 330                                                                                                                                                                                                                                                                                           <NA>
## 331                                                                                                                                                                                                                                                                                           <NA>
## 332                                                                                                                                                                                                                                                                                           <NA>
## 333                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 334                                                                                                                                                                                                                                                                                           <NA>
## 335                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 336                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 337                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 338                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 339                                                                                                                                                                                                                                                                                           <NA>
## 340                                                                                                                                                                                                                                                                                           <NA>
## 341                                                                                                                                                                                                                                                                                           <NA>
## 342                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 343                                                                                                                                                                                                                                                                                           <NA>
## 344                                                                                                                                                                                                                                                                                           <NA>
## 345                                                                                                                                                                                                                                                                                           <NA>
## 346                                                                                                                                                                                                                                                                                           <NA>
## 347                                                                                                                                                                                                                                                                                           <NA>
## 348                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 349                                                                                                                                                                                                                                                                                           <NA>
## 350                                                                                                                                                                                                                                                                                           <NA>
## 351                                                                                                                                                                                                                                                                                           <NA>
## 352                                                                                                                                                                                                                                                                                           <NA>
## 353                                                                                                                                                                                                                                                                                           <NA>
## 354                                                                                                                                                                                                                                                                                           <NA>
## 355                                                                                                                                                                                                                                                                                           <NA>
## 356                                                                                                                                                                                                                                                                                           <NA>
## 357                                                                                                                                                                                                                                                                                           <NA>
## 358                                                                                                                                                                                                                                                                                           <NA>
## 359                                                                                                                                                                                                                                                                                           <NA>
## 360                                                                                                                                                                                                                                                                                           <NA>
## 361                                                                                                                                                                                                                                                                                           <NA>
## 362                                                                                                                                                                                                                                                                                           <NA>
## 363                                                                                                                                                                                                                                                                                           <NA>
## 364                                                                                                                                                                                                                                                                                           <NA>
## 365                                                                                                                                                                                                                                                                                           <NA>
## 366                                                                                                                                                                                                                                                                                           <NA>
## 367                                                                                                                                                                                                                                                                                           <NA>
## 368                                                                                                                                                                                                                                                                                           <NA>
## 369                                                                                                                                                                                                                                                                                           <NA>
## 370                                                                                                                                                                                                                                                                                           <NA>
## 371                                                                                                                                                                                                                                                                                           <NA>
## 372                                                                                                                                                                                                                                                                                           <NA>
## 373                                                                                                                                                                                                                                                                                           <NA>
## 374                                                                                                                                                                                                                                                                                           <NA>
## 375                                                                                                                                                                                                                                                                                           <NA>
## 376                                                                                                                                                                                                                                                                                           <NA>
## 377                                                                                                                                                                                                                                                                                           <NA>
## 378                                                                                                                                                                                                                                                                                           <NA>
## 379                                                                                                                                                                                                                                                                                           <NA>
## 380                                                                                                                                                                                                                                                                                           <NA>
## 381                                                                                                                                                                                                                                                                                           <NA>
## 382                                                                                                                                                                                                                                                                                           <NA>
## 383                                                                                                                                                                                                                                                                                           <NA>
## 384                                                                                                                                                                                                                                                                                           <NA>
## 385                                                                                                                                                                                                                                                                                           <NA>
## 386                                                                                                                                                                                                                                                                                           <NA>
## 387                                                                                                                                                                                                                                                                                           <NA>
## 388                                                                                                                                                                                                                                                                                           <NA>
## 389                                                                                                                                                                                                                                                                                           <NA>
## 390                                                                                                                                                                                                                                                                                           <NA>
## 391                                                                                                                                                                                                                                                                                           <NA>
## 392                                                                                                                                                                                                                                                                                           <NA>
## 393                                                                                                                                                                                                                                                                                           <NA>
## 394                                                                                                                                                                                                                                                                                           <NA>
## 395                                                                                                                                                                                                                                                                                           <NA>
## 396                                                                                                                                                                                                                                                                                           <NA>
## 397                                                                                                                                                                                                                                                                                           <NA>
## 398                                                                                                                                                                                                                                                                                           <NA>
## 399                                                                                                                                                                                                                                                                                           <NA>
## 400                                                                                                                                                                                                                                                                                           <NA>
## 401                                                                                                                                                                                                                                                                                           <NA>
## 402                                                                                                                                                                                                                                                                                           <NA>
## 403                                                                                                                                                                                                                                                                                           <NA>
## 404                                                                                                                                                                                                                                                                                           <NA>
## 405                                                                                                                                                                                                                                                                                           <NA>
## 406                                                                                                                                                                                                                                                                                           <NA>
## 407                                                                                                                                                                                                                                                                                           <NA>
## 408                                                                                                                                                                                                                                                                                           <NA>
## 409                                                                                                                                                                                                                                                                                           <NA>
## 410                                                                                                                                                                                                                                                                                           <NA>
## 411                                                                                                                                                                                                                                                                                           <NA>
## 412                                                                                                                                                                                                                                                                                           <NA>
## 413                                                                                                                                                                                                                                                                                           <NA>
## 414                                                                                                                                                                                                                                                                                           <NA>
## 415                                                                                                                                                                                                                                                                                           <NA>
## 416                                                                                                                                                                                                                                                                                           <NA>
## 417                                                                                                                                                                                                                                                                                           <NA>
## 418                                                                                                                                                                                                                                                                                           <NA>
## 419                                                                                                                                                                                                                                                                                           <NA>
## 420                                                                                                                                                                                                                                                                                           <NA>
## 421                                                                                                                                                                                                                                                                                           <NA>
## 422                                                                                                                                                                                                                                                                                           <NA>
## 423                                                                                                                                                                                                                                                                                           <NA>
## 424                                                                                                                                                                                                                                                                                           <NA>
## 425                                                                                                                                                                                                                                                                                           <NA>
## 426                                                                                                                                                                                                                                                                                           <NA>
## 427                                                                                                                                                                                                                                                                                           <NA>
## 428                                                                                                                                                                                                                                                                                           <NA>
## 429                                                                                                                                                                                                                                                                                           <NA>
## 430                                                                                                                                                                                                                                                                                           <NA>
## 431                                                                                                                                                                                                                                                                                           <NA>
## 432                                                                                                                                                                                                                                                                                           <NA>
## 433                                                                                                                                                                                                                                                                                           <NA>
## 434                                                                                                                                                                                                                                                                                           <NA>
## 435                                                                                                                                                                                                                                                                                           <NA>
## 436                                                                                                                                                                                                                                                                                           <NA>
## 437                                                                                                                                                                                                                                                                                           <NA>
## 438                                                                                                                                                                                                                                                                                           <NA>
## 439                                                                                                                                                                                                                                                                                           <NA>
## 440                                                                                                                                                                                                                                                                                           <NA>
## 441                                                                                                                                                                                                                                                                                           <NA>
## 442                                                                                                                                                                                                                                                                                           <NA>
## 443                                                                                                                                                                                                                                                                                           <NA>
## 444                                                                                                                                                                                                                                                                                           <NA>
## 445                                                                                                                                                                                                                                                                                           <NA>
## 446                                                                                                                                                                                                                                                                                           <NA>
## 447                                                                                                                                                                                                                                                                                           <NA>
## 448                                                                                                                                                                                                                                                                                           <NA>
## 449                                                                                                                                                                                                                                                                                           <NA>
## 450                                                                                                                                                                                                                                                                                           <NA>
## 451                                                                                                                                                                                                                                                                                           <NA>
## 452                                                                                                                                                                                                                                                                                           <NA>
## 453                                                                                                                                                                                                                                                                                           <NA>
## 454                                                                                                                                                                                                                                                                                           <NA>
## 455                                                                                                                                                                                                                                                                                           <NA>
## 456                                                                                                                                                                                                                                                                                           <NA>
## 457                                                                                                                                                                                                                                                                                           <NA>
## 458                                                                                                                                                                                                                                                                                           <NA>
## 459                                                                                                                                                                                                                                                                                           <NA>
## 460                                                                                                                                                                                                                                                                                           <NA>
## 461                                                                                                                                                                                                                                                                                           <NA>
## 462                                                                                                                                                                                                                                                                                           <NA>
## 463                                                                                                                                                                                                                                                                                           <NA>
## 464                                                                                                                                                                                                                                                                                           <NA>
## 465                                                                                                                                                                                                                                                                                           <NA>
## 466                                                                                                                                                                                                                                                                                           <NA>
## 467                                                                                                                                                                                                                                                                                           <NA>
## 468                                                                                                                                                                                                                                                                                           <NA>
## 469                                                                                                                                                                                                                                                                                           <NA>
## 470                                                                                                                                                                                                                                                                                           <NA>
## 471                                                                                                                                                                                                                                                                                           <NA>
## 472                                                                                                                                                                                                                                                                                           <NA>
## 473                                                                                                                                                                                                                                                                                           <NA>
## 474                                                                                                                                                                                                                                                                                           <NA>
## 475                                                                                                                                                                                                                                                                                           <NA>
## 476                                                                                                                                                                                                                                                                                           <NA>
## 477                                                                                                                                                                                                                                                                                           <NA>
## 478                                                                                                                                                                                                                                                                                           <NA>
## 479                                                                                                                                                                                                                                                                                           <NA>
## 480                                                                                                                                                                                                                                                                                           <NA>
## 481                                                                                                                                                                                                                                                                                           <NA>
## 482                                                                                                                                                                                                                                                                                           <NA>
## 483                                                                                                                                                                                                                                                                                           <NA>
## 484                                                                                                                                                                                                                                                                                           <NA>
## 485                                                                                                                                                                                                                                                                                           <NA>
## 486                                                                                                                                                                                                                                                                                           <NA>
## 487                                                                                                                                                                                                                                                                                           <NA>
## 488                                                                                                                                                                                                                                                                                           <NA>
## 489                                                                                                                                                                                                                                                                                           <NA>
## 490                                                                                                                                                                                                                                                                                           <NA>
## 491                                                                                                                                                                                                                                                                                           <NA>
## 492                                                                                                                                                                                                                                                                                           <NA>
## 493                                                                                                                                                                                                                                                                                           <NA>
## 494                                                                                                                                                                                                                                                                                           <NA>
## 495                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 496                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 497                                                                                                                                                                                                                                                                                           <NA>
## 498                                                                                                                                                                                                                                                                                           <NA>
## 499                                                                                                                                                                                                                                                                                           <NA>
## 500                                                                                                              Weatherhead PJ, Blouin-Demers G, Cavey KM. 2003. Seasonal and Prey-size Dietary Patterns of Black Ratsnakes (Elaphe obsoleta obsoleta). American Midland Naturalist 150, 275-281.
## 501                                                                                                                                                                                                                                                                                           <NA>
## 502                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 503                                                                                                                                                                                                                                                                                           <NA>
## 504                                                                                                                                                                                                                                                                                           <NA>
## 505                                                                                                                                                                                                                                                                                           <NA>
## 506                                                                                                                               Gregory PT, Isaac LA. 2004. Food Habits of the Grass Snake in Southeastern England: Is Natrix natrix a Generalist Predator? Journal of Herpetology 38(1): 88-95.
## 507                                                                                                                                                                                                                                                                                           <NA>
## 508                                                                                                                                                                             King RB. 2002. Predicted and Observed Maximum Prey Size - Snake Size Allometry. Functional Ecology 16(6), 766-772.
## 509                                                                                                                                                                                                                                                                                           <NA>
## 510                                                                                                                                                                                                                                                                                           <NA>
## 511                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 512                                                                                                                                                                                                                                                                                           <NA>
## 513                                                                                                                                                                                                                                                                                           <NA>
## 514                                                                                                                                                                                                                                                                                           <NA>
## 515                                                                                                                                                                                                                                                                                           <NA>
## 516                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 517                                                                                                                                                                                                                                                                                           <NA>
## 518                                                                                                                                                                                                                                                                                           <NA>
## 519                                                                                                                                                                                                                                                                                           <NA>
## 520                                                                                                                                                                                                                                                                                           <NA>
## 521                                                                                                                                                                                                                                                                                           <NA>
## 522                                                                                                                                                                                                                                                                                           <NA>
## 523                                                                                                                                                                                                                                                                                           <NA>
## 524                                                                                                                                                                                                                                                                                           <NA>
## 525                                                                                                                                                                                                                                                                                           <NA>
## 526                                                                                                                                                                                                                                                                                           <NA>
## 527                                                                                                                                                                                                                                                                                           <NA>
## 528                                                                                                                                                                                                                                                                                           <NA>
## 529                                                                                                                                                                                                                                                                                           <NA>
## 530                                                                                                                   Vincent SW, Herrel A, Irschick DJ. 2004. Sexual dimorphism in head shape and diet in the cottonmouth. Journal of Zoology, London 264, 53-59.\nsnake (Agkistrodon piscivorus)
## 531                                                                                                                                                                                                                                                                                           <NA>
## 532 Martins M, Marques OAV, Sazima I. 2002. Ecological and phylogenetic correlates of feeding habits in Neotropical pitvipers of the genus Bothrops. In G. W. Schuett, M. E. Douglas, M. H\xf6ggren, and H. W. Greene (eds.), Biology of the Vipers. Eagle Mountain Publishing, Eagle Mountain, UT
## 533                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 534                                                                                                                                                                                                                                                                                           <NA>
## 535                                                                                                                                                                                      Clark RW. 2002. Diet of the timber rattlesnake, Crotalus horridus. Journal of Herpetology 36(3), 494-499.
## 536                                                                                                                                                                                                                                                                                           <NA>
## 537                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
## 538                                                                                                                                                                                                                                                                                           <NA>
## 539                                                                                                                                                                                                                                                                                           <NA>
## 540                                                                                                                                                                                                                                                                                           <NA>
## 541                                                                                                                                   Shine R, Sun L-X. 2003. Attack strategy of an ambush predator: which attributes of the prey trigger a pit-viper\x92s strike? Functional Ecology 17, 340-348.
## 542                                                                                                                                                                                                                                                                                           <NA>
## 543                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
## 544                                                                                                                                                                                                                                                                                           <NA>
## 545                                                                                                                                                                                                                                                                                           <NA>
## 546                                                                                                                                                                                                                                                                                           <NA>
## 547                                                                                                                                                                                                                                                                                           <NA>
## 548                                                                                                                                                                                                                                                                                           <NA>
## 549                                                                                                                                                                                                                                                                                           <NA>
## 550                                                                                                                                                                                                                                                                                           <NA>
## 551                                                                                                                                                                                                                                                                                           <NA>
## 552                                                                                                                                                                                                                                                                                           <NA>
## 553                                                                                                                                                                                                                                                                                           <NA>
## 554                                                                                                                                                                                                                                                                                           <NA>
## 555                                                                                                                                                                                                                                                                                           <NA>
## 556                                                                                                                                                                                                                                                                                           <NA>
## 557                                                                                                                                                                                                                                                                                           <NA>
## 558                                                                                                                                                                                                                                                                                           <NA>
## 559                                                                                                                                                                                                                                                                                           <NA>
## 560                                                                                                                                                                                                                                                                                           <NA>
## 561                                                                                                                                                                                                                                                                                           <NA>
## 562                                                                                                                                                                                                                                                                                           <NA>
## 563                                                                                                                                                                                                                                                                                           <NA>
## 564                                                                                                                                                                                                                                                                                           <NA>
## 565                                                                                                                                                                                                                                                                                           <NA>
## 566                                                                                                                                                                                                                                                                                           <NA>
## 567                                                                                                                                                                                                                                                                                           <NA>
## 568                                                                                                                                                                                                                                                                                           <NA>
## 569                                                                                                                                                                                                                                                                                           <NA>
```


```r
summary(homerange)
```

```
##     taxon           common.name           class              order          
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##     family             genus             species          primarymethod     
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##       N              mean.mass.g        log10.mass     
##  Length:569         Min.   :      0   Min.   :-0.6576  
##  Class :character   1st Qu.:     50   1st Qu.: 1.6990  
##  Mode  :character   Median :    330   Median : 2.5185  
##                     Mean   :  34602   Mean   : 2.5947  
##                     3rd Qu.:   2150   3rd Qu.: 3.3324  
##                     Max.   :4000000   Max.   : 6.6021  
##                                                        
##  alternative.mass.reference  mean.hra.m2          log10.hra     
##  Length:569                 Min.   :0.000e+00   Min.   :-1.523  
##  Class :character           1st Qu.:4.500e+03   1st Qu.: 3.653  
##  Mode  :character           Median :3.934e+04   Median : 4.595  
##                             Mean   :2.146e+07   Mean   : 4.709  
##                             3rd Qu.:1.038e+06   3rd Qu.: 6.016  
##                             Max.   :3.551e+09   Max.   : 9.550  
##                                                                 
##  hra.reference         realm           thermoregulation    locomotion       
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  trophic.guild       dimension            preymass         log10.preymass   
##  Length:569         Length:569         Min.   :     0.67   Min.   :-0.1739  
##  Class :character   Class :character   1st Qu.:    20.02   1st Qu.: 1.3014  
##  Mode  :character   Mode  :character   Median :    53.75   Median : 1.7304  
##                                        Mean   :  3989.88   Mean   : 2.0188  
##                                        3rd Qu.:   363.35   3rd Qu.: 2.5603  
##                                        Max.   :130233.20   Max.   : 5.1147  
##                                        NA's   :502         NA's   :502      
##       PPMR         prey.size.reference
##  Min.   :  0.380   Length:569         
##  1st Qu.:  3.315   Class :character   
##  Median :  7.190   Mode  :character   
##  Mean   : 31.752                      
##  3rd Qu.: 15.966                      
##  Max.   :530.000                      
##  NA's   :502
```


**3. Change the class of the variables `taxon` and `order` to factors and display their levels.**  

```r
homerange$taxon<-as.factor(homerange$taxon)
homerange$order<-as.factor(homerange$order)
```


```r
levels(homerange$taxon)
```

```
## [1] "birds"         "lake fishes"   "lizards"       "mammals"      
## [5] "marine fishes" "river fishes"  "snakes"        "tortoises"    
## [9] "turtles"
```

```r
levels(homerange$order)
```

```
##  [1] "accipitriformes"       "afrosoricida"          "anguilliformes"       
##  [4] "anseriformes"          "apterygiformes"        "artiodactyla"         
##  [7] "caprimulgiformes"      "carnivora"             "charadriiformes"      
## [10] "columbidormes"         "columbiformes"         "coraciiformes"        
## [13] "cuculiformes"          "cypriniformes"         "dasyuromorpha"        
## [16] "dasyuromorpia"         "didelphimorphia"       "diprodontia"          
## [19] "diprotodontia"         "erinaceomorpha"        "esociformes"          
## [22] "falconiformes"         "gadiformes"            "galliformes"          
## [25] "gruiformes"            "lagomorpha"            "macroscelidea"        
## [28] "monotrematae"          "passeriformes"         "pelecaniformes"       
## [31] "peramelemorphia"       "perciformes"           "perissodactyla"       
## [34] "piciformes"            "pilosa"                "proboscidea"          
## [37] "psittaciformes"        "rheiformes"            "roden"                
## [40] "rodentia"              "salmoniformes"         "scorpaeniformes"      
## [43] "siluriformes"          "soricomorpha"          "squamata"             
## [46] "strigiformes"          "struthioniformes"      "syngnathiformes"      
## [49] "testudines"            "tinamiformes"          "tetraodontiformes\xa0"
```


**4. What taxa are represented in the `homerange` data frame? Make a new data frame `taxa` that is restricted to taxon, common name, class, order, family, genus, species.**  

```r
taxa <- select(homerange, "taxon", "common.name", "class", "order", "family", "genus", "species")
```

**5. The variable `taxon` identifies the common name groups of the species represented in `homerange`. Make a table the shows the counts for each of these `taxon`.**  

```r
table(taxa$taxon)
```

```
## 
##         birds   lake fishes       lizards       mammals marine fishes 
##           140             9            11           238            90 
##  river fishes        snakes     tortoises       turtles 
##            14            41            12            14
```

**6. The species in `homerange` are also classified into trophic guilds. How many species are represented in each trophic guild.**  

```r
table(homerange$trophic.guild)
```

```
## 
## carnivore herbivore 
##       342       227
```

**7. Make two new data frames, one which is restricted to carnivores and another that is restricted to herbivores.**  

```r
carnivores <- filter(homerange, trophic.guild=="carnivore")
herbivores <- filter(homerange, trophic.guild=="herbivore")
```

**8. Do herbivores or carnivores have, on average, a larger `mean.hra.m2`? Remove any NAs from the data.**  

```r
mean(carnivores$mean.hra.m2)
```

```
## [1] 13039918
```


```r
mean(herbivores$mean.hra.m2)
```

```
## [1] 34137012
```

**9. Make a new dataframe `owls` that is limited to the mean mass, log10 mass, family, genus, and species of owls in the database. Which is the smallest owl? What is its common name? Do a little bit of searching online to see what you can learn about this species and provide a link below** all owls below to one 


```r
select(homerange, "mean.mass.g", "log10.mass", "family", "genus", "species")
```

```
##     mean.mass.g  log10.mass            family           genus
## 1        887.00  2.94792362       anguillidae        anguilla
## 2        562.00  2.74973632      catostomidae       moxostoma
## 3         34.00  1.53147892        cyprinidae      campostoma
## 4          4.00  0.60205999        cyprinidae     clinostomus
## 5          4.00  0.60205999        cyprinidae     rhinichthys
## 6       3525.00  3.54715912          esocidae            esox
## 7        737.36  2.86767957           gadidae      pollachius
## 8        448.61  2.65186895           gadidae      pollachius
## 9        109.04  2.03758584      acanthuridae      acanthurus
## 10       772.16  2.88770730      acanthuridae            naso
## 11       151.84  2.18138619      acanthuridae            naso
## 12         6.20  0.79239169         blennidae   ophioblennius
## 13       726.18  2.86104428        carangidae          caranx
## 14       196.00  2.29225607     centrarchidae     ambloplites
## 15        82.00  1.91381385     centrarchidae         lepomis
## 16        79.00  1.89762709     centrarchidae         lepomis
## 17        16.00  1.20411998     centrarchidae         lepomis
## 18      1134.00  3.05461305     centrarchidae     micropterus
## 19      2125.00  3.32735893     centrarchidae     micropterus
## 20       423.00  2.62634037     centrarchidae         pomoxis
## 21        27.63  1.44138089    chaetodontidae       chaetodon
## 22        31.88  1.50351831    chaetodontidae       chaetodon
## 23        60.54  1.78204242    chaetodontidae       chaetodon
## 24        70.45  1.84788100    chaetodontidae       chaetodon
## 25        78.12  1.89276223    chaetodontidae       chaetodon
## 26      1551.13  3.19064820  cheilodactylidae  cheilodactylus
## 27         0.45 -0.34678749       cirrhitidae  amblycirrhitus
## 28        10.45  1.01911629       cirrhitidae  cirrhitichthys
## 29      1450.23  3.16143689          cottidae scorpaenichthys
## 30         2.70  0.43136376          gobiidae   amblyeleotris
## 31         0.31 -0.50863831          gobiidae      lythrypnus
## 32         0.22 -0.65757732          gobiidae       priolepis
## 33         4.00  0.60205999          gobiidae    rhinogobiops
## 34        71.23  1.85266294          gobiidae    valenciennea
## 35      1086.71  3.03611366        kyphosidae        kyphosus
## 36       133.38  2.12509071          labridae        bodianus
## 37      1644.90  3.21613950          labridae        chelinus
## 38       119.16  2.07613050          labridae           coris
## 39         7.17  0.85551916          labridae     halichoeres
## 40         6.57  0.81756537          labridae     halichoeres
## 41         9.55  0.98000337          labridae     halichoeres
## 42         7.03  0.84695533          labridae     halichoeres
## 43         3.49  0.54282543          labridae       labroides
## 44       362.30  2.55906833          labridae          labrus
## 45        95.54  1.98018524          labridae   opthalmolepis
## 46      1484.14  3.17147487          labridae   semicossyphus
## 47       103.47  2.01481445          labridae   tautogolabrus
## 48         3.12  0.49415459          labridae      thalassoma
## 49        84.06  1.92458939          labridae      thalassoma
## 50       236.76  2.37430833       lethrinidae       lethrinus
## 51      2167.70  3.33599918        lutjanidae        lutjanus
## 52        56.04  1.74849813        lutjanidae        lutjanus
## 53        50.00  1.69897000        lutjanidae        lutjanus
## 54        56.27  1.75027691        lutjanidae        lutjanus
## 55      1176.86  3.07072480        lutjanidae         ocyurus
## 56      1940.27  3.28786217     malacanthidae    caulolatilus
## 57        85.99  1.93444795         moronidae   dicentrarchus
## 58       297.72  2.47380801          mullidae  mulloidichthys
## 59       191.55  2.28228216          mullidae      parupeneus
## 60       134.00  2.12710480          percidae           perca
## 61        94.58  1.97579931     pomacanthidae       abudefduf
## 62         2.50  0.39794001     pomacanthidae      centropyge
## 63        28.41  1.45347123     pomacentridae         chromis
## 64         9.19  0.96331551     pomacentridae     chrysiptera
## 65         3.96  0.59769519     pomacentridae       dascyllus
## 66        10.49  1.02077549     pomacentridae     pomacentrus
## 67        45.30  1.65609820     pomacentridae       stegastes
## 68         6.64  0.82216808     pomacentridae       stegastes
## 69        39.00  1.59106461     pomacentridae       stegastes
## 70      1668.11  3.22222469          scaridae       chlorurus
## 71       171.42  2.23406149          scaridae          scarus
## 72       289.40  2.46149853          scaridae          scarus
## 73       250.64  2.39905038          scaridae       sparisoma
## 74       388.84  2.58977093          scaridae       sparisoma
## 75       523.80  2.71916549          scaridae       sparisoma
## 76       521.16  2.71697108          scaridae       sparisoma
## 77       697.00  2.84323278        serranidae   cephalopholis
## 78       436.24  2.63972549        serranidae   cephalopholis
## 79       119.00  2.07554696        serranidae   cephalopholis
## 80       476.00  2.67760695        serranidae   cephalopholis
## 81       312.30  2.49457198        serranidae     epinephelus
## 82       398.51  2.60043922        serranidae     epinephelus
## 83      2181.15  3.33868553        serranidae     epinephelus
## 84      2362.06  3.37329093        serranidae     epinephelus
## 85      3081.08  3.48870297        serranidae     epinephelus
## 86       119.00  2.07554696        serranidae  hypoplectrodes
## 87        24.87  1.39567578        serranidae  hypoplectrodes
## 88      3247.34  3.51152776        serranidae    mycteroperca
## 89       378.42  2.57797408        serranidae      paralabrax
## 90      1527.64  3.18402102        serranidae      paralabrax
## 91      1992.23  3.29933948        serranidae    plectropomus
## 92      1753.40  3.24388100        serranidae    plectropomus
## 93        41.11  1.61394748        serranidae        serranus
## 94        75.93  1.88041340        serranidae        serranus
## 95       731.58  2.86426182          sparidae           sarpa
## 96       934.20  2.97043986          sparidae          sparus
## 97        99.20  1.99651167        salmonidae    oncorhynchus
## 98        47.00  1.67209786        salmonidae    oncorhynchus
## 99       109.00  2.03742650        salmonidae    oncorhynchus
## 100        2.00  0.30103000        salmonidae           salmo
## 101      402.00  2.60422605        salmonidae           salmo
## 102        5.00  0.69897000          cottidae          cottus
## 103        3.00  0.47712126          cottidae          cottus
## 104        5.00  0.69897000          cottidae          cottus
## 105     1100.33  3.04152295        sebastidae        sebastes
## 106       99.25  1.99673052        sebastidae        sebastes
## 107     1341.25  3.12750973        sebastidae        sebastes
## 108      737.78  2.86792688        sebastidae        sebastes
## 109      780.54  2.89239516        sebastidae        sebastes
## 110      202.00  2.30535137       ictaluridae       ictalurus
## 111        9.55  0.98000337      syngnathidae     hippocampus
## 112        1.22  0.08635983      syngnathidae        nerophis
## 113        8.96  0.95230801    tetraodontidae    canthigaster
## 114     3000.00  3.47712126      accipitridae          aquila
## 115      846.00  2.92737036      accipitridae           buteo
## 116     1699.00  3.23019338      accipitridae       circaetus
## 117     2049.00  3.31154196      accipitridae      hieraaetus
## 118      975.00  2.98900462      accipitridae      hieraaetus
## 119     2203.00  3.34301450      accipitridae        neophron
## 120      719.00  2.85672889          anatidae            anas
## 121     2320.00  3.36548799       apterygidae         apteryx
## 122       48.00  1.68124124     caprimulgidae     caprimulgus
## 123      521.00  2.71683772    haematopodidae      haematopus
## 124       47.70  1.67851838        columbidae     scardafella
## 125      150.00  2.17609126        columbidae         columba
## 126      140.33  2.14715052        columbidae    streptopelia
## 127      103.00  2.01283723        coraciidae        coracias
## 128       67.00  1.82607480          upupidae           upupa
## 129      151.50  2.18041263         cuculidae        clamator
## 130      128.00  2.10720997         cuculidae         cuculus
## 131      300.00  2.47712126         cuculidae       geococcyx
## 132      433.00  2.63648790         cuculidae     neopmorphus
## 133      469.00  2.67117284      accipitridae       accipiter
## 134      978.00  2.99033886      accipitridae       accipiter
## 135      807.00  2.90687353      accipitridae       accipiter
## 136      141.00  2.14921911      accipitridae       accipiter
## 137     1126.00  3.05153839      accipitridae           buteo
## 138      626.00  2.79657433      accipitridae           buteo
## 139      971.00  2.98721923      accipitridae           buteo
## 140      521.00  2.71683772      accipitridae          circus
## 141      315.50  2.49899936      accipitridae          circus
## 142     1033.70  3.01439452      accipitridae          milvus
## 143     1125.00  3.05115252        falconidae        caracara
## 144      625.00  2.79588002        falconidae        daptrius
## 145      675.00  2.82930377        falconidae           falco
## 146      721.00  2.85793527        falconidae           falco
## 147      781.50  2.89292898        falconidae           falco
## 148      112.00  2.04921802        falconidae           falco
## 149      200.00  2.30103000        falconidae           falco
## 150      410.00  2.61278386       phasianidae          bonasa
## 151     1750.00  3.24303805       phasianidae    centrocercus
## 152     1050.00  3.02118930       phasianidae     dendragapus
## 153      620.00  2.79239169       phasianidae         lagopus
## 154      381.50  2.58149454       phasianidae          perdix
## 155     1139.00  3.05652372       phasianidae          tetrao
## 156     2936.00  3.46775605       phasianidae          tetrao
## 157      900.00  2.95424251       phasianidae     typmanuchus
## 158      506.00  2.70415052          rallidae        aramides
## 159      165.00  2.21748394          rallidae            crex
## 160      266.00  2.42488164          rallidae          rallus
## 161       11.00  1.04139268    acrocephalisae       hippolais
## 162        8.00  0.90308999      aegithalidae      aegithalos
## 163       30.00  1.47712125         alaudidae         lululla
## 164       37.70  1.57634135      cardinalidae           habia
## 165       32.80  1.51587384      cardinalidae           habia
## 166        8.77  0.94299959         certhidae         certhia
## 167        9.80  0.99122608      cisticolidae       cisticola
## 168     1410.00  3.14921911          corvidae          corvus
## 169      130.00  2.11394335          corvidae       nucifraga
## 170       42.00  1.62324929        cotingidae       phytotoma
## 171       16.70  1.22271647       emberizidae      ammodramus
## 172       14.30  1.15533604       emberizidae       passerina
## 173       46.30  1.66558099       emberizidae          pipilo
## 174       44.70  1.65030752       emberizidae          pipilo
## 175       18.10  1.25767857       emberizidae        spizella
## 176       12.20  1.08635983       emberizidae        spizella
## 177     1550.00  3.19033170      fringillidae       carduelis
## 178       23.25  1.36642296      fringillidae       fringilla
## 179       10.70  1.02938378      fringillidae         serinus
## 180       89.00  1.94939001         icteridae       sturnella
## 181       89.00  1.94939001         icteridae       sturnella
## 182       27.00  1.43136376          incertae         icteria
## 183       30.00  1.47712125          laniidae         laniuis
## 184       48.10  1.68214508          laniidae         laniuis
## 185       44.22  1.64561874          laniidae          lanius
## 186       35.00  1.54406804          laniidae          lanius
## 187       50.10  1.69983773           mimidae           mimus
## 188       21.22  1.32674538      motacillidae       motacilla
## 189       17.50  1.24303805      motacillidae       motacilla
## 190       12.80  1.10720997      muscicapidae       muscicapa
## 191       25.20  1.40140054      muscicapidae        oenanthe
## 192       15.21  1.18212921      muscicapidae     phoenicurus
## 193       16.48  1.21695721      muscicapidae        saxicola
## 194       11.00  1.04139268           paridae           parus
## 195       10.10  1.00432137           paridae           parus
## 196       16.60  1.22010809           paridae           parus
## 197       11.00  1.04139268           paridae           parus
## 198       11.30  1.05307844         parulidae  geothlypis\xa0
## 199        9.80  0.99122608         parulidae      geothylpis
## 200       16.10  1.20682588         parulidae    protonotaria
## 201       18.90  1.27646180         parulidae         seiurus
## 202        9.70  0.98677173         parulidae       setophaga
## 203       14.00  1.14612804         parulidae       setophaga
## 204        8.60  0.93449845         parulidae       setophaga
## 205        9.60  0.98227123         parulidae       setophaga
## 206        9.50  0.97772360         parulidae       setophaga
## 207        9.00  0.95424251         parulidae       setophaga
## 208        9.00  0.95424251         parulidae       setophaga
## 209        9.30  0.96848295         parulidae        wilsonia
## 210        7.50  0.87506126    phylloscopidae    phylloscopus
## 211      158.00  2.19865709 ptilonorhynchidae    scenopoeetes
## 212        5.30  0.72427587         regulidae         regulus
## 213        5.15  0.71180723         regulidae         regulus
## 214       18.30  1.26245109         stittidae           sitta
## 215       14.80  1.17026172          sylvidae         chamaea
## 216       10.50  1.02118930         sylviidae          sylvia
## 217        8.80  0.94448267         sylviidae          sylvia
## 218       11.00  1.04139268     troglodytidae      thryomanes
## 219       18.50  1.26717173     troglodytidae     thryothorus
## 220       11.20  1.04921802     troglodytidae     troglodytes
## 221        9.50  0.97772360     troglodytidae     troglodytes
## 222       30.80  1.48855072          turdidae          sialia
## 223       13.80  1.13987909        tyrannidae        contopus
## 224        9.90  0.99563519        tyrannidae       empidonax
## 225       12.30  1.08990511        tyrannidae       empidonax
## 226       40.40  1.60638137        tyrannidae        tyrannus
## 227        8.50  0.92941893        vireonidae           vireo
## 228       10.00  1.00000000        vireonidae           vireo
## 229       11.40  1.05690485        vireonidae           vireo
## 230       17.60  1.24551267        vireonidae           vireo
## 231      900.00  2.95424251          ardeidae        botaurus
## 232       67.00  1.82607480          ardeidae      ixobrychus
## 233      277.37  2.44305949           picidae       dryocopus
## 234       38.00  1.57978360           picidae            jynx
## 235      109.25  2.03842145           picidae        picoides
## 236       59.00  1.77085201           picidae        picoides
## 237       65.65  1.81723473           picidae        picoides
## 238      124.50  2.09516935           picidae           picus
## 239      186.67  2.27107453           picidae           picus
## 240     1941.00  3.28802554       strigopidae        strigops
## 241    25000.00  4.39794001           rheidae            rhea
## 242    15000.00  4.17609126           rheidae            rhea
## 243      119.00  2.07554696         strigidae        aegolius
## 244      252.00  2.40140054         strigidae            asio
## 245      156.50  2.19451434         strigidae          athene
## 246     2191.00  3.34064238         strigidae            bubo
## 247     1510.00  3.17897695         strigidae            bubo
## 248       61.32  1.78760215         strigidae      glaucidium
## 249     1920.00  3.28330123         strigidae          nyctea
## 250      519.00  2.71516736         strigidae           strix
## 251      285.00  2.45484486         tytonidae            tyto
## 252    88250.00  4.94571471     struthionidae        struthio
## 253      622.00  2.79379038         tinamidae     nothoprocta
## 254      436.52  2.64000415   chrysochloridae    chrysospalax
## 255       23.00  1.36172784   chrysochloridae      eremitalpa
## 256    46099.90  4.66369998    antilocapridae     antilocapra
## 257    63503.84  4.80279999           bovidae       aepyceros
## 258   136000.34  5.13353999           bovidae      alcelaphus
## 259   167498.14  5.22400999           bovidae      ammotragus
## 260   629999.20  5.79934000           bovidae           bison
## 261   628000.52  5.79796000           bovidae           bison
## 262    50999.98  4.70757001           bovidae           capra
## 263    69499.23  4.84197999           bovidae           capra
## 264    18143.87  4.25872993           bovidae     cephalophus
## 265    20411.74  4.30988003           bovidae     cephalophus
## 266    21474.84  4.33192994           bovidae         gazella
## 267     4600.02  3.66275972           bovidae         madoqua
## 268   629999.20  5.79934000           bovidae        oreamnos
## 269   113998.73  5.05690001           bovidae            ovis
## 270    90719.36  4.95769998           bovidae            ovis
## 271    11300.04  4.05307998           bovidae      raphicerus
## 272    30999.88  4.49136001           bovidae       rupicapra
## 273   635038.42  5.80280000           bovidae     taurotragus
## 274    54431.46  4.73584998           bovidae     tragelaphus
## 275   197314.95  5.29515999           bovidae     tragelaphus
## 276   307227.44  5.48746000          cervidae           alces
## 277    62823.19  4.79811998          cervidae            axis
## 278    24050.27  4.38111996          cervidae       capreolus
## 279   234757.78  5.37061999          cervidae          cervus
## 280    29450.32  4.46909002          cervidae          cervus
## 281    71449.63  4.85399998          cervidae            dama
## 282    13499.88  4.13032991          cervidae       muntiacus
## 283    53864.17  4.73129997          cervidae      odocoileus
## 284    87884.04  4.94391001          cervidae      odocoileus
## 285    35000.16  4.54407003          cervidae      ozotoceros
## 286     7499.98  3.87506011          cervidae            pudu
## 287   102058.69  5.00884999          cervidae        rangifer
## 288  1339985.19  6.12710000        giraffidae         giraffa
## 289   230001.15  5.36173001        giraffidae          okapia
## 290    80513.74  4.90587000            suidae    phacochoerus
## 291    34700.04  4.54032997       tayassuidae       catagonus
## 292    23205.98  4.36559991       tayassuidae          pecari
## 293    20250.23  4.30642996       tayassuidae         tayassu
## 294    10850.01  4.03543014        tragulidae      hyemoschus
## 295     5399.95  3.73238974         ailuridae         ailurus
## 296     4989.53  3.69805964           canidae          alopex
## 297    27749.81  4.44326001           canidae           canis
## 298     7370.04  3.86746985           canidae     pseudalopex
## 299     3989.97  3.60096963           canidae     pseudalopex
## 300     4499.97  3.65320962           canidae          vulpes
## 301     3249.97  3.51187935           canidae          vulpes
## 302     2089.30  3.32000080           canidae          vulpes
## 303       60.00  1.77815125         dipodidae      stylodipus
## 304     9549.93  3.98000019        eupleridae    cryptoprocta
## 305    50000.00  4.69897000           felidae        acinonyx
## 306    12999.90  4.11394001           felidae         caracal
## 307     3394.53  3.53077965           felidae           felis
## 308     4825.03  3.68350002           felidae           felis
## 309     6803.93  3.83275984           felidae     herpailurus
## 310     9989.64  3.99954984           felidae       leopardus
## 311     3628.77  3.55975944           felidae       leopardus
## 312    11999.97  4.07918016           felidae     leptailurus
## 313    10205.87  4.00885003           felidae            lynx
## 314    29999.91  4.47711995           felidae            lynx
## 315    11049.94  4.04335992           felidae            lynx
## 316    11339.92  4.05460999           felidae            lynx
## 317     3589.96  3.55508961           felidae       oncifelis
## 318    84040.77  4.92449002           felidae        panthera
## 319    48374.89  4.68461999           felidae        panthera
## 320   112000.51  5.04922000           felidae        panthera
## 321     2500.00  3.39794001           felidae    prionailurus
## 322    89999.48  4.95424000           felidae            puma
## 323    30500.01  4.48429998           felidae           uncia
## 324     3599.98  3.55630009       herpestidae          atilax
## 325      620.00  2.79239169       herpestidae        cynictis
## 326      281.84  2.45000263       herpestidae        helogale
## 327     2810.00  3.44870632       herpestidae       herpestes
## 328     3599.98  3.55630009       herpestidae       ichneumia
## 329    10000.00  4.00000000          hyanidae        proteles
## 330     4466.22  3.64994011        mustelidae            eira
## 331     1750.01  3.24304053        mustelidae        galictis
## 332    21545.67  4.33336000        mustelidae            gulo
## 333      883.49  2.94620164        mustelidae          martes
## 334     1799.99  3.25527009        mustelidae          martes
## 335     2475.03  3.39358047        mustelidae          martes
## 336     3175.19  3.50176972        mustelidae          martes
## 337      270.54  2.43223149        mustelidae         mustela
## 338      150.19  2.17664102        mustelidae         mustela
## 339      808.74  2.90780892        mustelidae         mustela
## 340      562.34  2.74999898        mustelidae         mustela
## 341      912.01  2.95999960        mustelidae         mustela
## 342       88.10  1.94497591        mustelidae         mustela
## 343      524.81  2.72000210        mustelidae         mustela
## 344     8618.27  3.93542010        mustelidae         taxidea
## 345     2887.62  3.46054004       procyonidae           potos
## 346    87500.39  4.94200999           ursidae      ailuropoda
## 347    97750.73  4.99012001           ursidae        melursus
## 348     1750.01  3.24304053        viverridae         genetta
## 349     2150.01  3.33244048        viverridae         genetta
## 350     8000.00  3.90308999        viverridae         viverra
## 351     1096.48  3.04000071        dasyuridae        dasyurus
## 352     2810.00  3.44870632        dasyuridae        dasyurus
## 353       23.00  1.36172784        dasyuridae     sminthopsis
## 354       27.50  1.43933269        dasyuridae      antechinus
## 355       19.50  1.29003461       didelphidae     monodelphis
## 356       29.00  1.46239800       didelphidae        thylamys
## 357     6649.97  3.82281969      macropodidae     dendrolagus
## 358    27250.22  4.43537001      macropodidae        macropus
## 359    11249.93  4.05114982      macropodidae        macropus
## 360    22124.83  4.34487994      macropodidae        macropus
## 361    10375.05  4.01599020      macropodidae        macropus
## 362    21250.05  4.32735996      macropodidae        macropus
## 363    16850.00  4.22659990      macropodidae        macropus
## 364    46249.82  4.66511005      macropodidae        macropus
## 365     4646.01  3.66708014      macropodidae       petrogale
## 366     1660.01  3.22011070        potoroidae       bettongia
## 367     1899.98  3.27874903        potoroidae        potorous
## 368     1299.99  3.11394001   pseudocheiridae     petauroides
## 369     5000.00  3.69897000      macropodidae     onychogalea
## 370     4649.97  3.66745015      macropodidae       thylogale
## 371     5399.95  3.73238974      macropodidae       thylogale
## 372    14999.96  4.17609010      macropodidae        wallabia
## 373     2875.01  3.45863936     phalangeridae     trichosurus
## 374    25499.99  4.40654001        vombatidae     lasiorhinus
## 375    25999.80  4.41497001        vombatidae        vombatus
## 376      800.00  2.90308999       erinaceidae       erinaceus
## 377      296.00  2.47129171       erinaceidae     hemiechinus
## 378      340.20  2.53173431         leporidae     brachylagus
## 379     1360.79  3.13379111         leporidae           lepus
## 380     4050.05  3.60746038         leporidae           lepus
## 381     2267.98  3.35563922         leporidae           lepus
## 382     3549.11  3.55011946         leporidae           lepus
## 383     5250.01  3.72016013         leporidae           lepus
## 384     3129.97  3.49554017         leporidae           lepus
## 385     2825.01  3.45101999         leporidae           lepus
## 386     1600.00  3.20411998         leporidae     oryctolagus
## 387     2150.01  3.33244048         leporidae      sylvilagus
## 388     1360.79  3.13379111         leporidae      sylvilagus
## 389     1349.99  3.13033055         leporidae      sylvilagus
## 390      155.30  2.19117146       ochotonidae        ochotona
## 391      146.50  2.16583762       ochotonidae        ochotona
## 392       58.00  1.76342799   macroscelididae    elephantulus
## 393      201.00  2.30319606   macroscelididae     petrodromus
## 394      535.20  2.72851611   macroscelididae     rhynchocyon
## 395      257.00  2.40993312    tachyglossidae    tachyoryctes
## 396      390.50  2.59162104       peramelidae         isoodon
## 397      775.00  2.88930170       peramelidae         isoodon
## 398   427996.29  5.63144000           equidae           equus
## 399  2249986.95  6.35218000    rhinocerotidae   ceratotherium
## 400  1050001.69  6.02119000    rhinocerotidae         diceros
## 401     3899.96  3.59106015      bradypodidae        bradypus
## 402  4000000.08  6.60206000      elephantidae         elephas
## 403  4000000.08  6.60206000      elephantidae       loxodonta
## 404       22.00  1.34242268        cricetidae       onychomys
## 405     1133.99  3.05460923     aplodontiidae      aplodontia
## 406      625.00  2.79588002      bathyergidae      bathyergus
## 407      148.00  2.17026172      bathyergidae       cryptomys
## 408       65.00  1.81291336      bathyergidae       cryptomys
## 409      242.00  2.38381537      bathyergidae       georychus
## 410      155.00  2.19033170      bathyergidae    heliophobius
## 411       39.00  1.59106461      bathyergidae  heterocephalus
## 412     8000.00  3.90308999          caviidae      dolichotus
## 413     5190.03  3.71516987     chinchillidae      lagostomus
## 414       22.57  1.35353156        cricetidae   clethrionomys
## 415       66.30  1.82151353        cricetidae       hylaeamys
## 416       92.14  1.96444821        cricetidae          lemmus
## 417       38.00  1.57978360        cricetidae        microtus
## 418       70.87  1.85046243        cricetidae        microtus
## 419       56.70  1.75358306        cricetidae        microtus
## 420       35.44  1.54949371        cricetidae        microtus
## 421       49.61  1.69556923        cricetidae        microtus
## 422       29.50  1.46982202        cricetidae        microtus
## 423       85.50  1.93196612        cricetidae        microtus
## 424       30.00  1.47712125        cricetidae          myopus
## 425      395.48  2.59712452        cricetidae         neotoma
## 426      308.30  2.48897353        cricetidae         neotoma
## 427      132.29  2.12152702        cricetidae         neotoma
## 428      255.15  2.40679557        cricetidae         neotoma
## 429     1360.79  3.13379111        cricetidae         ondatra
## 430       27.54  1.43996394        cricetidae      peromyscus
## 431       11.05  1.04336228        cricetidae reithrodontomys
## 432       38.27  1.58285846        cricetidae      synaptomys
## 433       52.50  1.72015930         dipodidae      pygeretmus
## 434      350.00  2.54406804        echimyidae      proechimys
## 435      428.00  2.63144377        echimyidae      proechimys
## 436     4250.01  3.62838995    erethizontidae         coendou
## 437     8618.27  3.93542010    erethizontidae       erethizon
## 438      160.18  2.20460829         geomyidae        thomomys
## 439       68.80  1.83758844          gliridae      graphiurus
## 440       31.00  1.49136169          gliridae     muscardinus
## 441      153.56  2.18627810      heteromyidae       dipodomys
## 442       41.82  1.62138403      heteromyidae       dipodomys
## 443       56.70  1.75358306      heteromyidae       dipodomys
## 444      144.58  2.16010822      heteromyidae       dipodomys
## 445       76.20  1.88195497      heteromyidae       dipodomys
## 446    17000.04  4.23044994       hystricidae         hystrix
## 447    14999.96  4.17609010       hystricidae         hystrix
## 448     2749.98  3.43932954       hystridicae       atherurus
## 449       31.60  1.49968708           muridae        apodemus
## 450       21.20  1.32633586           muridae        apodemus
## 451       88.30  1.94596070           muridae        meriones
## 452      122.00  2.08635983           muridae       pseudomys
## 453     1185.00  3.07371835        nesomyidae      hypogeomys
## 454      215.60  2.33364876        nesomyidae         nesomys
## 455      165.45  2.21866677        nesomyidae         nesomys
## 456      100.86  2.00371896      octodontidae      spalacopus
## 457       95.80  1.98136551         sciuridae        eutamias
## 458      102.50  2.01072387         sciuridae      funambulus
## 459      148.84  2.17271966         sciuridae       glaucomys
## 460       64.50  1.80955972         sciuridae       glaucomys
## 461     3401.97  3.53173048         sciuridae         marmota
## 462     3401.97  3.53173048         sciuridae         marmota
## 463      375.00  2.57403127         sciuridae       paraxerus
## 464      793.80  2.89971109         sciuridae         sciurus
## 465      532.98  2.72671091         sciuridae         sciurus
## 466      264.30  2.42209716         sciuridae         sciurus
## 467      952.99  2.97908834         sciuridae         sciurus
## 468      327.50  2.51521130         sciuridae         sciurus
## 469      725.75  2.86078704         sciuridae    spermophilus
## 470      578.34  2.76218323         sciuridae    spermophilus
## 471      637.87  2.80473218         sciuridae    spermophilus
## 472      794.49  2.90008843         sciuridae    spermophilus
## 473      106.00  2.02530586         sciuridae    spermophilus
## 474      198.45  2.29765110         sciuridae    spermophilus
## 475      748.43  2.87415119         sciuridae    spermophilus
## 476       26.93  1.43023635         sciuridae          tamias
## 477       42.52  1.62859326         sciuridae          tamias
## 478       42.52  1.62859326         sciuridae          tamias
## 479       42.52  1.62859326         sciuridae          tamias
## 480      223.96  2.35017046         sciuridae    tamiasciurus
## 481      502.00  2.70070372         sciuridae           xerus
## 482       10.00  1.00000000         soricidae       crocidura
## 483        8.13  0.91009055         soricidae           sorex
## 484        4.17  0.62013606         soricidae           sorex
## 485        9.33  0.96988164         soricidae           sorex
## 486        4.37  0.64048144         soricidae           sorex
## 487       14.13  1.15014216         soricidae           sorex
## 488       47.86  1.67997269          talpidae       condylura
## 489      103.50  2.01494035          talpidae        scalopus
## 490       96.50  1.98452731          talpidae           talpa
## 491       81.42  1.91073110          talpidae           talpa
## 492     2500.00  3.39794001          agamidae       uromastyx
## 493        3.46  0.53907610        colubridae       carphopis
## 494        3.65  0.56229286        colubridae       carphopis
## 495      556.15  2.74519194        colubridae         coluber
## 496      144.50  2.15986785        colubridae         coluber
## 497        9.00  0.95424251        colubridae       diadophis
## 498      450.00  2.65321251        colubridae      drymarchon
## 499      256.70  2.40942587        colubridae          elaphe
## 500      642.80  2.80807587        colubridae          elaphe
## 501      147.32  2.16826171        colubridae       heterodon
## 502      234.10  2.36940141        colubridae       hierophis
## 503      315.72  2.49930209        colubridae    lampropeltis
## 504      165.00  2.21748394        colubridae    lampropeltis
## 505      534.50  2.72794771        colubridae     masticophis
## 506       78.50  1.89486966        colubridae          natrix
## 507      313.24  2.49587722        colubridae         nerodia
## 508      190.55  2.28000895        colubridae         nerodia
## 509       62.50  1.79588002        colubridae      oocatochus
## 510      375.00  2.57403127        colubridae       pituophis
## 511     1004.00  3.00173371        colubridae       pituophis
## 512       21.51  1.33264041        colubridae      thamnophis
## 513      306.00  2.48572143        colubridae      thamnophis
## 514      249.30  2.39672228        colubridae         zamenis
## 515       48.79  1.68833082          elapidae   hoplocephalus
## 516      330.00  2.51851394          elapidae        notechis
## 517      479.00  2.68033551          elapidae      pseudechis
## 518     7000.00  3.84509804         iguanidae      conolophus
## 519     3780.00  3.57749180         iguanidae         cyclura
## 520     3200.00  3.50514998         iguanidae         cyclura
## 521     4223.33  3.62565502         iguanidae         cyclura
## 522      927.00  2.96707973         iguanidae      sauromalus
## 523      210.00  2.32221930         iguanidae      sauromalus
## 524       59.00  1.77085201        lacertilia     dipsosaurus
## 525       40.00  1.60205999        lacertilia        gallotia
## 526       28.00  1.44715803       liolaemidae      phymaturus
## 527     1226.85  3.08879147        pythonidae         morelia
## 528      638.00  2.80482068         scincidae         egernia
## 529      231.12  2.36383753         viperidae     agkistrodon
## 530      188.00  2.27415785         viperidae     agkistrodon
## 531       16.95  1.22916970         viperidae           bitis
## 532      826.23  2.91710096         viperidae        bothrops
## 533      319.90  2.50501424         viperidae        crotalus
## 534      106.70  2.02816442         viperidae        crotalus
## 535     1020.00  3.00860017         viperidae        crotalus
## 536      414.00  2.61700034         viperidae        crotalus
## 537      138.70  2.14207646         viperidae        crotalus
## 538       67.20  1.82736927         viperidae        crotalus
## 539      280.30  2.44762310         viperidae        crotalus
## 540      234.70  2.37051309         viperidae        crotalus
## 541      196.81  2.29404716         viperidae        gloydius
## 542      162.14  2.20989017         viperidae     montivipera
## 543       97.40  1.98855896         viperidae          vipera
## 544      691.00  2.83947805          chelidae       chelodina
## 545      595.00  2.77451697          chelidae     mesoclemmys
## 546     4250.00  3.62838893       chelydridae        chelydra
## 547      354.50  2.54961624          emydidae       chrysemys
## 548      588.00  2.76937733          emydidae     deirochelys
## 549     1294.00  3.11193428          emydidae       emydoidea
## 550      462.00  2.66464198          emydidae            emys
## 551     1135.00  3.05499586          emydidae       graptemys
## 552      211.00  2.32428246          emydidae       terrapene
## 553      720.60  2.85769426       geoemydidae        mauremys
## 554      154.70  2.18949031     kinosternidae     kinosternon
## 555      164.00  2.21484385     kinosternidae    sternotherus
## 556      190.00  2.27875360     kinosternidae    sternotherus
## 557     6166.60  3.79004578      testudinidae      geochelone
## 558     2000.00  3.30103000      testudinidae        gopherus
## 559      335.00  2.52504481      testudinidae        gopherus
## 560      232.00  2.36548799      testudinidae     indotestudo
## 561      620.00  2.79239169      testudinidae         kinixys
## 562     3000.00  3.47712126      testudinidae        manouria
## 563      500.00  2.69897000      testudinidae     psammobates
## 564    10600.00  4.02530586      testudinidae    stigmochelys
## 565      400.00  2.60205999      testudinidae         testudo
## 566     1522.00  3.18241465      testudinidae         testudo
## 567     1018.00  3.00774778      testudinidae         testudo
## 568      222.00  2.34635297      testudinidae         testudo
## 569     2982.33  3.47455570      trionychidae         apalone
##                      species
## 1                   rostrata
## 2                  poecilura
## 3                   anomalum
## 4                funduloides
## 5                 cataractae
## 6                masquinongy
## 7                 pollachius
## 8                     virens
## 9                   lineatus
## 10                 lituratus
## 11                 unicornis
## 12                atlanticus
## 13                 ignobilis
## 14                 rupestris
## 15                  gibbosus
## 16               macrochirus
## 17                 megalotis
## 18                  dolomieu
## 19                 salmoides
## 20                 annularis
## 21                 baronessa
## 22                 trichrous
## 23              trifascialis
## 24              trifasciatus
## 25              unimaculatus
## 26              spectrabilis
## 27                     pinos
## 28                     falco
## 29                marmoratus
## 30                  japonica
## 31                     dalli
## 32                  hipoliti
## 33                 nicholsii
## 34               longipinnis
## 35                 sectatrix
## 36                     rufus
## 37                 undulatus
## 38                     julis
## 39                bivittatus
## 40                   garnoti
## 41               maculipinna
## 42                     poeyi
## 43                dimidiatus
## 44                  bergylta
## 45                lineolatus
## 46                   pulcher
## 47                 adspersus
## 48               bifasciatum
## 49                    lunare
## 50                     harak
## 51                    analis
## 52                    apodus
## 53                decussatus
## 54                   griseus
## 55                 chrysurus
## 56                  princeps
## 57                    labrax
## 58             flavolineatus
## 59                porphyreus
## 60                flavescens
## 61                   luridus
## 62                      argi
## 63                   chromis
## 64                biocellata
## 65                   aruanus
## 66                     wardi
## 67                  apicalis
## 68                  partitus
## 69                variabilis
## 70               microrhinos
## 71                     iseri
## 72                 rivulatus
## 73              aurofrenatum
## 74              chrysopterum
## 75                rubripinne
## 76                    viride
## 77                     argus
## 78                 cruentata
## 79               hemistiktos
## 80                   miniata
## 81                  guttatus
## 82                marginatus
## 83                     morio
## 84                  striatus
## 85                   tauvina
## 86                    huntii
## 87               maccullochi
## 88                    bonaci
## 89                clathratus
## 90                 nebulifer
## 91                 areolatus
## 92                 leopardus
## 93                  cabrilla
## 94                    scriba
## 95                     salpa
## 96                   auratus
## 97                    clarki
## 98                     gilae
## 99                    mykiss
## 100                    salar
## 101                   trutta
## 102                   bairdi
## 103                carolinae
## 104                    gobio
## 105                 caurinus
## 106                  inermis
## 107                  maliger
## 108                 melanops
## 109                 mustinus
## 110                  natalis
## 111               guttulatus
## 112           lumbriciformis
## 113                 rostrata
## 114               chrysaetos
## 115                    buteo
## 116                 gallicus
## 117                fasciatus
## 118                 pennatus
## 119             percnopterus
## 120                 strepera
## 121                australis
## 122                europaeus
## 123               ostralegus
## 124                     inca
## 125                 palumbus
## 126                   turtur
## 127                 garrulus
## 128                    epops
## 129               glandarius
## 130                  canorus
## 131            californianus
## 132               radiolosus
## 133                 cooperii
## 134                 gentilis
## 135                    nisus
## 136                 striatus
## 137              jamaicensis
## 138                 lineatus
## 139                swainsoni
## 140                  cyaneus
## 141                 pygargus
## 142                   milvus
## 143                 cheriway
## 144               americanus
## 145                biarmicus
## 146                mexicanus
## 147               peregrinus
## 148               sparverius
## 149              tinnunculus
## 150                  bonasia
## 151             urophasianus
## 152                 obscurus
## 153                  lagopus
## 154                   perdix
## 155                   tetrix
## 156                urogallus
## 157          cupido pinnatus
## 158                    wolfi
## 159                     crex
## 160                  elegans
## 161               polyglotta
## 162                 caudatus
## 163                  arborea
## 164               fuscicauda
## 165                   rubica
## 166               familiaris
## 167                 juncidis
## 168                    corax
## 169            caryocatactes
## 170                raimondii
## 171               savannarum
## 172                   cyanea
## 173                   aberti
## 174                   fuscus
## 175                  arborea
## 176                passerina
## 177                cannabina
## 178                  coelebs
## 179                  serinus
## 180                    magna
## 181                 neglecta
## 182                   virens
## 183                 collurio
## 184             ludovicianus
## 185                    minor
## 186                  senator
## 187              polyglottos
## 188                     alba
## 189                    flava
## 190                  striata
## 191                 oenanthe
## 192              phoenicurus
## 193                  rubetra
## 194             atricapillus
## 195             carolinensis
## 196                inornatus
## 197                palustris
## 198             philadelphia
## 199                  trichas
## 200                   citrea
## 201             aurocapillus
## 202                    fusca
## 203                kirtlandi
## 204                 magnolia
## 205             pensylvanica
## 206                 petechia
## 207                ruticilla
## 208                   virens
## 209               canadensis
## 210                  bonelli
## 211             dentirostris
## 212             ignicapillus
## 213                  regulus
## 214                 europaea
## 215                 fasciata
## 216                    sarda
## 217                   undata
## 218                 bewickiI
## 219             ludovicianus
## 220                    aedon
## 221              troglodytes
## 222                   sialis
## 223                   virens
## 224                  minimus
## 225                 wrightii
## 226                 tyrannus
## 227             atricapillus
## 228                    belli
## 229                  griseus
## 230                olivaceus
## 231                stellaris
## 232                   exilis
## 233                  martius
## 234                torquilla
## 235                 leucotos
## 236                   medius
## 237              tridactylus
## 238                    canus
## 239                  viridis
## 240              habroptilus
## 241                americana
## 242                  pennata
## 243                 funereus
## 244                     otus
## 245                   noctua
## 246                     bubo
## 247              virginianus
## 248               passerinum
## 249                scandiaca
## 250                    aluco
## 251                     alba
## 252                  camelus
## 253                   ornata
## 254               trevelyani
## 255                   granti
## 256                americana
## 257                 melampus
## 258               buselaphus
## 259                   lervia
## 260                    bison
## 261                  bonasus
## 262                   hircus
## 263                pyrenaica
## 264               callipygus
## 265                 dorsalis
## 266                  gazella
## 267                guentheri
## 268               americanus
## 269                    ammon
## 270               canadensis
## 271               campestris
## 272                rupicapra
## 273                     oryx
## 274                 scriptus
## 275             strepsiceros
## 276                    alces
## 277                     axis
## 278                capreolus
## 279                  elaphus
## 280                   nippon
## 281                     dama
## 282                  reevesi
## 283                 hemionus
## 284              virginianus
## 285              bezoarticus
## 286                     puda
## 287                 tarandus
## 288           camelopardalis
## 289                johnstoni
## 290              aethiopicus
## 291                  wagneri
## 292                   tajacu
## 293                   pecari
## 294                aquaticus
## 295                  fulgens
## 296                  lagopus
## 297                 simensis
## 298                 culpaeus
## 299                  griseus
## 300                  macroti
## 301                 ruppelli
## 302                    velox
## 303                    telum
## 304                    ferox
## 305                  jubatus
## 306                  caracal
## 307                    catus
## 308               sylvestris
## 309             yagouaroundi
## 310                 pardalis
## 311                   wiedii
## 312                   serval
## 313               canadensis
## 314                     lynx
## 315                 pardinus
## 316                    rufus
## 317                geoffroyi
## 318                     onca
## 319                   pardus
## 320                   tigris
## 321              bengalensis
## 322                 concolor
## 323                    uncia
## 324              paludinosus
## 325              penicillata
## 326                  parvula
## 327               inchneumon
## 328                albicauda
## 329                cristatus
## 330                  barbata
## 331                  vittata
## 332                     gulo
## 333                americana
## 334                    foina
## 335                   martes
## 336                 pennanti
## 337                  erminea
## 338                  frenata
## 339                     furo
## 340                 lutreola
## 341                 nigripes
## 342                  nivalis
## 343                 sibirica
## 344                    taxus
## 345                   flavus
## 346              melanoleuca
## 347                  ursinus
## 348                  genetta
## 349                  tigrina
## 350                  zibetha
## 351                geoffroii
## 352                maculatus
## 353                 leucopus
## 354                 stuartii
## 355                americana
## 356                  elegans
## 357                lumholtzi
## 358              antilopinus
## 359                 dorsalis
## 360              fuliginosus
## 361                giganteus
## 362                 robustus
## 363              rufogriseus
## 364                    rufus
## 365                assimilis
## 366                 gaimardi
## 367                 longipes
## 368                   volans
## 369                 fraenata
## 370               stigmatica
## 371                   thetis
## 372                  bicolor
## 373                vulpecula
## 374                 krefftii
## 375                  ursinus
## 376                europaeus
## 377                  auritus
## 378               idahoensis
## 379               americanus
## 380                 arcticus
## 381             californicus
## 382                 capensis
## 383                europaeus
## 384              nigricollis
## 385                  timidus
## 386                cuniculus
## 387                aquaticus
## 388               floridanus
## 389                palustris
## 390                curzoniae
## 391                 princeps
## 392                rufescens
## 393            tetradactylus
## 394              chrysopygus
## 395                splendens
## 396                  auratus
## 397                 obesulus
## 398                 caballus
## 399                    simum
## 400                 bicornis
## 401                torquatus
## 402                  maximus
## 403                 africana
## 404                 torridus
## 405                     rufa
## 406                  suillus
## 407               damarensis
## 408              hottentotus
## 409                 capensis
## 410         argenteocinereus
## 411                   glaber
## 412                patagonus
## 413                  maximus
## 414             californicus
## 415             megacephalus
## 416                sibiricus
## 417                 agrestis
## 418             californicus
## 419                 montanus
## 420              ochrogaster
## 421           pennsylvanicus
## 422                pinetorum
## 423              richardsoni
## 424             schisticolor
## 425                  cinerea
## 426                 fuscipes
## 427                   lepida
## 428                 micropus
## 429                zibethica
## 430               gossypinus
## 431              raviventris
## 432                  cooperi
## 433                  pumilio
## 434                  cuvieri
## 435             semispinosus
## 436              prehensilis
## 437                 dorsatum
## 438                   bottae
## 439                 ocularis
## 440             avellanarius
## 441                   ingens
## 442                 merriami
## 443                    ordii
## 444              spectabilis
## 445                stephensi
## 446         africaeaustralis
## 447                   indica
## 448                africanus
## 449              flavicollis
## 450               sylvaticus
## 451                hurrianae
## 452                   fuscus
## 453                 antimena
## 454                audeberti
## 455                    rufus
## 456                   cyanus
## 457                sibiricus
## 458                 pennanti
## 459                 sabrinus
## 460                   volans
## 461             flaviventris
## 462                    monax
## 463                palliatus
## 464                   aberti
## 465             carolinensis
## 466                      lis
## 467                    niger
## 468                 vulgaris
## 469                 beecheyi
## 470              columbianus
## 471               franklinii
## 472                  parryii
## 473                spilosoma
## 474         tridecemlineatus
## 475               variegatus
## 476                  amoenus
## 477                  minimus
## 478           quadrivittatus
## 479                 umbrinus
## 480               hudsonicus
## 481               erythropus
## 482                  russula
## 483                 arcticus
## 484                 cinereus
## 485                coronatus
## 486              gracillimus
## 487             unguiculatus
## 488                 cristata
## 489                aquaticus
## 490                 europaea
## 491                   romana
## 492                aegyptius
## 493                   vermis
## 494                  viridis
## 495              constrictor
## 496 constrictor flaviventris
## 497                punctatus
## 498                  couperi
## 499           guttata emoryi
## 500                 obsoleta
## 501              platirhinos
## 502             viridiflavus
## 503            getula getula
## 504               triangulum
## 505                flagellum
## 506                   natrix
## 507            erythrogaster
## 508                 sipeodon
## 509             rufodorsatus
## 510                catenifer
## 511             melanoleucus
## 512                  butleri
## 513                    gigal
## 514              longissimus
## 515              bungaroides
## 516                 scutatus
## 517             porphyriacus
## 518                 pallidus
## 519                  cyclura
## 520                   lewisi
## 521                  pinguis
## 522                 hispidua
## 523                   obesus
## 524                 dorsalis
## 525                  galloti
## 526              flagellifer
## 527        spilota imbricata
## 528                    major
## 529               contortrix
## 530              piscivorous
## 531               schneideri
## 532                    asper
## 533                    atrox
## 534                 cerastes
## 535                 horridus
## 536                 molossus
## 537        oreganus concolor
## 538                   pricei
## 539               scutulatus
## 540                   tigris
## 541              shedaoensis
## 542                   raddei
## 543                 latastei
## 544              longicollis
## 545                    dahli
## 546               serpentina
## 547          picta marginata
## 548              reticularia
## 549               blandingii
## 550              orbicularis
## 551            flavimaculata
## 552                   ornata
## 553                  leprosa
## 554                rubrubrum
## 555           minor peltifer
## 556                 odoratus
## 557               carbonaria
## 558                agassizii
## 559               polyphemus
## 560             travancorica
## 561                   spekii
## 562                 impressa
## 563                tentorius
## 564                 pardalis
## 565                   graeca
## 566                 hermanii
## 567               horsfieldi
## 568               kleinmanni
## 569                spinifera
```

```r
owls <- filter(homerange, order=="strigiformes")
```


```r
filter(owls, mean.mass.g <= 64) #common name shown in the displayed graph
```

```
##   taxon        common.name class        order    family      genus    species
## 1 birds Eurasian pygmy owl  aves strigiformes strigidae glaucidium passerinum
##   primarymethod    N mean.mass.g log10.mass alternative.mass.reference
## 1    telemetry* <NA>       61.32   1.787602                       <NA>
##   mean.hra.m2 log10.hra
## 1     1250000   6.09691
##                                                                                                                                                                            hra.reference
## 1 Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
##         realm thermoregulation locomotion trophic.guild dimension preymass
## 1 terrestrial        endotherm     flying     carnivore        3D    16.99
##   log10.preymass PPMR
## 1       1.230193 3.61
##                                                                                                                                                 prey.size.reference
## 1 Slagsvold T, Sonerud GA. 2007. Prey size and ingestion rate in raptors: importance for sex roles and reversed sexual size dimorphism. J. Avian Biol. 38: 650 661.
```
[Eurasian pygmy owl facts](https://animalia.bio/eurasian-pygmy-owl?letter=e)


**10. As measured by the data, which bird species has the largest homerange? Show all of your work, please. Look this species up online and tell me about it!**.  

```r
largest_homerange <- select(homerange, "mean.hra.m2", "species", "common.name", "class")%>%
  arrange(desc(mean.hra.m2))%>%
  filter(class=="aves")
largest_homerange
```

```
##      mean.hra.m2         species                    common.name class
## 1   241000000.00        cheriway                       caracara  aves
## 2   200980000.00        pygargus              Montagu's harrier  aves
## 3   153860000.00      peregrinus               peregrine falcon  aves
## 4   117300000.00        pennatus                   booted eagle  aves
## 5    84300000.00         camelus                        ostrich  aves
## 6    78500000.00        gallicus         short-toed snake eagle  aves
## 7    63585000.00          turtur           European turtle dove  aves
## 8    63570000.00    percnopterus               Egyptian vulture  aves
## 9    50240000.00           buteo                 common buzzard  aves
## 10   50000000.00       biarmicus                  lanner falcon  aves
## 11   45912000.00        strepera                        gadwall  aves
## 12   40000000.00        gentilis               Northern goshawk  aves
## 13   38460000.00         canorus                  common cuckoo  aves
## 14   28000000.00           corax                   common raven  aves
## 15   27550000.00      chrysaetos                   golden eagle  aves
## 16   25778434.50       mexicanus                 prairie falcon  aves
## 17   23880000.00         pennata                    lesser rhea  aves
## 18   19625000.00          milvus                       red kite  aves
## 19   19620000.00       fasciatus                Bonelli's eagle  aves
## 20   19620000.00            otus                 long-eared owl  aves
## 21   18158215.95    urophasianus                    sage grouse  aves
## 22   16000000.00            bubo             Eurasian eagle-owl  aves
## 23   12560000.00           epops                         hoopoe  aves
## 24   12560000.00      glandarius           great spotted cuckoo  aves
## 25   12030000.00 cupido pinnatus        greater prairie-chicken  aves
## 26    7100000.00           nisus           Eurasian sparrowhawk  aves
## 27    5500000.00       urogallus           western capercaillie  aves
## 28    5306600.00        leucotos        white-backed woodpecker  aves
## 29    4937157.00       scandiaca                      snowy owl  aves
## 30    4521600.00           canus         grey-headed woodpecker  aves
## 31    4249192.50     jamaicensis                red-tailed hawk  aves
## 32    3500000.00         martius               black woodpecker  aves
## 33    3140000.00       cannabina                  common linnet  aves
## 34    3140000.00        funereus                     boreal owl  aves
## 35    3000000.00     tinnunculus               European kestrel  aves
## 36    2540000.00        palumbus             common wood pigeon  aves
## 37    2521187.55         cyaneus                    hen harrier  aves
## 38    2464531.65       swainsoni                Swainson's hawk  aves
## 39    2460000.00      ostralegus                  oystercatcher  aves
## 40    2450000.00       americana                   greater rhea  aves
## 41    2254095.45        cooperii                  Cooper's hawk  aves
## 42    2124596.25     virginianus               great horned owl  aves
## 43    1975000.00          tetrix                   black grouse  aves
## 44    1850000.00         viridis      European green woodpecker  aves
## 45    1500000.00            alba                       barn owl  aves
## 46    1416397.50      sparverius               American kestrel  aves
## 47    1250000.00      passerinum             Eurasian pygmy owl  aves
## 48    1038100.00       torquilla               Eurasian wryneck  aves
## 49    1000000.00        garrulus                European roller  aves
## 50     995525.10        striatus             sharp-shinned hawk  aves
## 51     785000.00       europaeus              European nightjar  aves
## 52     785000.00            alba                  white wagtail  aves
## 53     666000.00      americanus          red-throated caracara  aves
## 54     639402.30        lineatus            red-shouldered hawk  aves
## 55     635800.00           minor             lesser grey shrike  aves
## 56     550000.00   californianus             greater roadrunner  aves
## 57     500000.00          noctua                     little owl  aves
## 58     499000.00      radiolosus           banded ground-cuckoo  aves
## 59     463900.00       australis            northern brown kiwi  aves
## 60     356932.17           aluco                      tawny owl  aves
## 61     350000.00     tridactylus Eurasian three-toed woodpecker  aves
## 62     195000.00     habroptilus                         kakapo  aves
## 63     193000.00       stellaris                  great bittern  aves
## 64     141500.00          medius     middle spotted woodpeckers  aves
## 65     132332.00   caryocatactes             spotted nutcracker  aves
## 66     103000.00         bonasia                   hazel grouse  aves
## 67      97000.00          exilis                  least bittern  aves
## 68      95000.00    dentirostris         tooth-billed bowerbird  aves
## 69      90000.00           wolfi                brown wood rail  aves
## 70      83769.80        tyrannus               eastern kingbird  aves
## 71      82960.43         arborea                       woodlark  aves
## 72      80000.00         senator                woodchat shrike  aves
## 73      75676.10    ludovicianus              loggerhead shrike  aves
## 74      62000.00          perdix                 grey partridge  aves
## 75      60702.75      fuscicauda       red-throated ant tanager  aves
## 76      48562.20          rubica        red-crowned ant tanager  aves
## 77      47000.00      familiaris           Eurasian treecreeper  aves
## 78      44029.73          virens             eastern wood pewee  aves
## 79      44000.00         elegans                      king rail  aves
## 80      43000.00            crex                      corncrake  aves
## 81      42000.00        caudatus                long-tailed tit  aves
## 82      42000.00         coelebs               common chaffinch  aves
## 83      35000.00         bonelli      Western Bonelli's warbler  aves
## 84      33993.54       kirtlandi             Kirtland's warbler  aves
## 85      30900.00       raimondii           Peruvian plantcutter  aves
## 86      30756.06       passerina               chipping sparrow  aves
## 87      30351.38           magna             eastern meadowlark  aves
## 88      30351.38        neglecta             western meadowlard  aves
## 89      30000.00      polyglotta              melodious warbler  aves
## 90      25899.84         lagopus               willow ptarmigan  aves
## 91      25899.84          fuscus                  canyon towhee  aves
## 92      24281.10       inornatus                   Oak titmouse  aves
## 93      24281.10          ornata                 ornate tinamou  aves
## 94      22662.36       palustris                      marsh tit  aves
## 95      21000.00        europaea              European nuthatch  aves
## 96      19900.00         regulus                      goldcrest  aves
## 97      16996.77        obscurus                   dusky grouse  aves
## 98      16996.77         arborea          American tree sparrow  aves
## 99      16500.00    ignicapillus               common firecrest  aves
## 100     16187.40          aberti                 Abert's towhee  aves
## 101     15782.72        collurio              red-backed shrike  aves
## 102     15782.72        wrightii       American gray flycatcher  aves
## 103     15378.03        oenanthe              northern wheatear  aves
## 104     14973.35    carolinensis             Carolina chickadee  aves
## 105     14973.35          citrea           prothonotary warbler  aves
## 106     14973.35    atricapillus             black-capped vireo  aves
## 107     14568.66    atricapillus         black-capped chickadee  aves
## 108     14400.00        juncidis       streaked fantail warbler  aves
## 109     11735.87           belli                   Bell's vireo  aves
## 110     10926.50      savannarum            grasshopper sparrow  aves
## 111     10117.13           flava         western yellow wagtail  aves
## 112     10117.13    aurocapillus                       ovenbird  aves
## 113     10117.13      canadensis                 Canada warbler  aves
## 114     10117.13     troglodytes                  Eurasian wren  aves
## 115     10117.13          sialis               eastern bluebird  aves
## 116     10000.00         serinus                 European serin  aves
## 117     10000.00         striata             spotted flycatcher  aves
## 118      7689.02    philadelphia               mourning warbler  aves
## 119      7300.00         rubetra                       whinchat  aves
## 120      7284.33        magnolia               magnolia warbler  aves
## 121      7284.33       olivaceus                 red-eyed vireo  aves
## 122      6474.96          virens   black-throated green warbler  aves
## 123      6070.28    pensylvanica         chestnut-sided warbler  aves
## 124      5260.91         trichas            common yellowthroat  aves
## 125      5260.91           fusca           Blackburnian warbler  aves
## 126      4856.22        bewickiI                 Berwick's wren  aves
## 127      4500.00     phoenicurus                common redstart  aves
## 128      4046.85     polyglottos           northern mockingbird  aves
## 129      4046.85           aedon                     house wren  aves
## 130      3300.00           sarda              Marmora's warbler  aves
## 131      3237.48        fasciata                        wrentit  aves
## 132      2800.00          undata               Dartford warbler  aves
## 133      2589.98            inca                      inca dove  aves
## 134      1942.49       ruticilla              American redstart  aves
## 135      1780.61         minimus               least flycatcher  aves
## 136      1699.68        petechia        American yellow warbler  aves
## 137      1335.46          virens           yellow-breasted chat  aves
## 138      1335.46         griseus               white-eyed vireo  aves
## 139      1214.06    ludovicianus                  Carolina wren  aves
## 140      1052.18          cyanea                 indigo bunting  aves
```

```r
filter(largest_homerange, mean.hra.m2 > 230000000.00)
```

```
##   mean.hra.m2  species common.name class
## 1    2.41e+08 cheriway    caracara  aves
```

[Cheriway caracara facts](http://greglasley.com/content/BirdsofNorthAmerica/CrestedCaracara.php)

The Cheriway caracara is also known as the mexican eagle. It usually feeds decaying animals but they also feed on snakes and lizards. They make raspy grunting when they are trying to vocalize their voice. During this vocalization, they tilt their heads so far up and back that their heads are eventually upside down behind their backs. 


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
