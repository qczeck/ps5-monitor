# ps5-monitor

Prywatny monitor ofert PS5 na OLX.

Callback OAuth: <https://qczeck.github.io/ps5-monitor/>

## Setup
1. `cp .env.example .env` i uzupelnij client_id / client_secret z developer.olx.pl
2. `./authorize.sh` -> zaloguj sie, zatwierdz zgode
3. Skopiuj kod ze strony callback
4. `./exchange.sh <kod>` -> tokeny laduja w `tokens.json`
5. `./refresh.sh` gdy access_token wygasnie
