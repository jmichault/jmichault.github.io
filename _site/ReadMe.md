# Jekyll-Plurlingva

Ĉi tio estas skeleto por krei plurlingvan statikan retejon kun jekyll.

jekyll-dokumentaro : <https://jekyllrb.com/docs/>


## Instalado

Kopiu la arbon, metu vian prezenton en eo/pri.md.  
Komencu la retejon per:  
```bash
_scripts/komenci "Via titolo" "Via priskribo"
```

Lanĉu la retejon :
```bash
bundle exec jekyll serve
```
Nun via retejo alireblas ĉi tie: http://localhost:4000

## Aldonante afiŝon
Aldonu dosieron en eo/_posts nomata YYYY-MM-DD-titolo.md .  
La unuaj linioj devas enhavi kaplinion YAML kun almenaŭ la etikedoj: layout:, title:, slug:, lang: kaj lang-ref:.
Jen ekzemplo :
    ---
    layout: post
    title: Bonvenon al mia blogo!
    slug: Bonvenon!
    lang: eo
    lang-ref: bonvenon-al-mia-blogo
    ---
    
    Bonvenon al mia blogo!


## Traduki la retejon
Lanĉu la skripton _scripts/traduki :
```bash
_scripts/traduki
```
Korektu la tradukojn generitajn en _locale (ekzemple kun poedit).
Lanĉu la skripton _scripts/traduki duan fojon:
```bash
_scripts/traduki
```


