# ps5-monitor

Prywatny monitor ofert PS5 na OLX.

Callback OAuth: <https://qczeck.github.io/ps5-monitor/>

## Setup
1. `cp .env.example .env` i uzupełnij client_id / client_secret z developer.olx.pl
2. `./authorize.sh` → zaloguj się, zatwierdź zgodę
3. Skopiuj kod ze strony callback
4. `./exchange.sh <kod>` → tokeny lądują w `tokens.json`
5. `./refresh.sh` gdy access_token wygaśnie
