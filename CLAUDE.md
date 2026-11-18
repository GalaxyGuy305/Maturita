# CLAUDE.md

Tento priečinok je Obsidian vault, ktorý slúži ako materiál a poznámky na učenie sa na maturitu zo Slovenského jazyka a literatúry.

## Štruktúra vaultu

Vault sa delí na 3 hlavné časti:

1. **`Root\`** – V koreni vaultu sa nachádzajú všetky markdown poznámky. Organizácia je inšpirovaná systémom „self-organizing notes" od Steph Ango (Celestial vault). Namiesto veľa vnorených priečinkov sa vo vaulte naviguje cez properties, Quick Switcher, Obsidian Bases a linky.
   - Každá poznámka má property `categories`, v ktorej je linknutá centrálna hub poznámka, napr. `[[Literárne Obdobia]]`. V tejto hub poznámke je embednutá Obsidian Base so všetkými poznámkami danej kategórie (napr. so všetkými literárnymi obdobiami).
   - Každá kategória poznámok môže mať aj vlastné custom properties, ktoré slúžia ako bonus.
   - Výhoda tohto systému: na rozdiel od vnorených priečinkov môže mať jedna poznámka viac ako jednu kategóriu.
2. **`Zdroje\`** – Priečinok s externými zdrojmi, napr. učebné materiály od našej učiteľky, materiály z kníh z našej školy alebo materiály od externých učiteľov.
   - Na rozdiel od rootu vaultu má tento priečinok tradičnú organizáciu vnorených priečinkov.
   - Delí sa na `PDFka (Lit)`, `PDFka (Jazyk)`, `PDFka (Štylistika)`, `Tahak (Lit / SJL)` a `Zmaturuj (Lit)`. V každom z nich sú ďalšie priečinky pre každý celok, napr. `Zdroje\Zmaturuj (Lit)\Barok`.
   - V `PDFka (Lit)` môžu byť celky ďalej rozdelené (napr. `Európsky` / `Slovenský`, `Lyrika` / `Próza` / `Dráma`). Každý autor má vlastný priečinok a úryvky alebo plné texty jeho diel sú v podpriečinku `Texty diel`, napr. `Zdroje\PDFka (Lit)\Realizmus\Slovenský\Martin Kukučín\Texty diel`.
   - Fotky zo Zmaturuj a Ťaháku sú pomenované podľa formátu `<strana>_<téma>`, napr. `32_Europsky-barok.jpeg`.
3. **`Requirementy\Requirementy.md`** – Požiadavky, ktoré napísal user podľa toho, čo počul od učiteľky alebo videl na škole. Súbor je samovysvetľujúci; v skratke obsahuje všetko, čo je na maturite nevyhnutné (must have).

## Pravidlá vaultu

1. **AI nikdy nemení** `Requirementy`, `Zdroje` ani nastavenia (`.claude`, `.gitignore`, `.obsidian`, ...), pokiaľ to nie je výslovne uvedené v prompte.
   - Rovnako AI nikdy neopravuje chyby, ktoré nájde vo vaulte popri práci a ktoré neboli v prompte vôbec spomenuté. Chybu vždy iba nahlási, aby user mohol zvážiť, či je to naozaj chyba, alebo je to akceptovateľné.
2. Všetky Obsidian Base súbory (`.base`) patria do `Templates\Bases\`.
3. Zdroje/informácie, ktoré nepochádzajú zo `Zdroje\`, musia byť označené:
   - „🤖" – informácia priamo od AI,
   - „💻" – informácia z reálnych zdrojov mimo našich zdrojov (zvyčajne internet a pod.).
   - Priorita zdrojov: `Zdroje\` → („🤖" && „💻", t. j. AI informácia overená reálnym zdrojom) → („🤖" || „💻", t. j. iba jedno z nich).
4. Dodržiavať štýl vaultu (viď nižšie).

## Štýl vaultu

1. **Poznámky pre obdobia/celky**, ktoré výrazne oddeľujú časť v requirementoch (napr. Staroveká literatúra, nie Sumerská literatúra), by mali vždy obsahovať rovnaký štýl tabuľky povinných vecí.
   - Ideálna štruktúra: **Úvod, Znaky, Tabuľka, Časová os**.
   - Ak sa táto štruktúra nedá dodržať alebo chceš pridať nejakú časť, môžeš to pokojne urobiť, ale najprv to iba navrhni.
2. **Poznámky pre dôležité diela** by mali ideálne obsahovať: **Kompozícia, Postavy, Dejová línia, Hlavná myšlienka, Zaradenie do obdobia, Súvislosti, Moja kresba** (bonus, ak user používa Excalidraw).
   - Dejových línií môže byť viac – jedna pre každý zdroj (napr. ako v poznámke Epos o Gilgamešovi).
   - Ak chceš niečo zmeniť alebo pridať, môžeš, ale najprv to povedz.
3. **PDFká majú prednosť pred obyčajným markdownom**, hlavne tie, ktoré hovoria o konkrétnej veci. Napr. ak existuje PDF o Ľudovítovi Štúrovi (čo bude), malo by byť embednuté v poznámke o Štúrovi.
   - Momentálne to tak vo vaulte vôbec nie je, takže sa to bude postupne opravovať.
   - **Túto reorganizáciu nikdy nerob sám.** User musí vždy povedať, aké PDF a čo odstrániť/pridať, prípadne sa ho opýtaj.
4. **Žiadne duplikáty.** Ak vytváraš nejakú „outlier" poznámku (napr. `Epos`), najprv over, či už taká poznámka náhodou neexistuje.
   - Ak neexistuje, vytvor ju a prepoj.
   - Ak existuje, iba do nej doplň relevantné veci, ktoré v nej ešte nie sú, a pridaj na ňu link.

## Konvencie

1. **Rob iba to, čo ti bolo povedané.** Ak je prompt zlý alebo si si niečo všimol, vždy to navrhni alebo na to usera upozorni. Ak je prompt široký (napr. „sprav to lepšie"), vždy najprv povedz, čo plánuješ zmeniť, a až potom to urob.
2. **Jasné a zrozumiteľné commity.** Žiadne „vault backup + dátum" ani jednoslovné správy typu „barok". Pracujeme na vaulte traja, takže z commitov sa musí dať zorientovať.
   - **Formát commit message:**
     - **Prvý riadok (summary):** krátke zhrnutie celého commitu (ideálne do ~300 znakov).
     - **Prázdny riadok.**
     - **Telo:** detailnejšie informácie o zmenách ako stručné odrážky (čo sa pridalo/zmenilo/odstránilo a v ktorých poznámkach). Žiadne slohovky – iba vecné body.
   - Príklad:
     ```
     Romantizmus: nove poznamky pre Sturovcov

     - Pridane poznamky: Ľudovít Štúr, Samo Chalupka, Ján Botto
     - Romantizmus.md: doplnena tabulka a casova os
     - Literárni Autori: napojene nove poznamky cez categories
     ```
   - Ak commituje user, upozorni ho, nech si s commit message dá aspoň 20 sekúnd effortu.
3. **Chýbajúce mená zo Zmaturuj.** Niektoré requirementy obsahujú poznámky typu „(aspoň 5 ďalších mien zo Zmaturuj)". Ak ti ich user ešte nedal, vždy ho požiadaj, aby ti tie mená dal – zvyčajne sú to podčiarknuté mená, ktoré tvoj image reader pravdepodobne nezachytí. Ak ti ich nedá, povedz mu, že je lenivé prasa, lebo to trvá max. 1 minútu 🥀.

## Dočasná poznámka

Väčšina poznámok vo vaulte vznikla ešte pred vytvorením tohto `CLAUDE.md`, takže veľa z vyššie uvedených pravidiel v nich nemusí byť dodržaných. Ber to do úvahy, keď vo vaulte uvidíš nejaký neporiadok.
