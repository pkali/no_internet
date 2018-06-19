/*
scr48	=	%00111111	;screen 48b
scr40	=	%00111110	;screen 40b
scr32	=	%00111101	;screen 32b
*/

* ---------------------------------------------------------------------------------------------
* ---	GTIA
* ---------------------------------------------------------------------------------------------
HPOSP0	=	$D000		; pozioma pozycja gracza 0 (Z)
HPOSP1	=	$D001		; pozioma pozycja gracza 1 (Z)
HPOSP2	=	$D002		; pozioma pozycja gracza 2 (Z)
HPOSP3	=	$D003		; pozioma pozycja gracza 3 (Z)
HPOSM0	=	$D004		; pozioma pozycja pocisku 0 (Z)
HPOSM1	=	$D005		; pozioma pozycja pocisku 1 (Z)
HPOSM2	=	$D006		; pozioma pozycja pocisku 2 (Z)
HPOSM3	=	$D007		; pozioma pozycja pocisku 3 (Z)
SIZEP0	=	$D008		; poziomy rozmiar gracza 0 (Z)
SIZEP1	=	$D009		; poziomy rozmiar gracza 1 (Z)
SIZEP2	=	$D00A		; poziomy rozmiar gracza 2 (Z)
SIZEP3	=	$D00B		; poziomy rozmiar gracza 3 (Z)
SIZEM	=	$D00C		; poziomy rozmiar pocisk�w (Z)
GRAFP0	=	$D00D		; rejestr grafiki gracza 0 (Z)
GRAFP1	=	$D00E		; rejestr grafiki gracza 1 (Z)
GRAFP2	=	$D00F		; rejestr grafiki gracza 2 (Z)
GRAFP3	=	$D010		; rejestr grafiki gracza 3 (Z)
GRAFM	=	$D011		; rejestr grafiki pocisk�w (Z)
COLPM0	=	$D012		; rejestr koloru gracza i pocisku 0 (Z)
COLPM1	=	$D013		; rejestr koloru gracza i pocisku 1 (Z)
COLPM2	=	$D014		; rejestr koloru gracza i pocisku 2 (Z)
COLPM3	=	$D015		; rejestr koloru gracza i pocisku 3 (Z)
COLPF0	=	$D016		; rejestr koloru pola gry 0 (Z)
COLPF1	=	$D017		; rejestr koloru pola gry 1 (Z)
COLPF2	=	$D018		; rejestr koloru pola gry 2 (Z)
COLPF3	=	$D019		; rejestr koloru pola gry 3 (Z)
COLBAK	=	$D01A		; rejestr koloru t�a (Z)

COLOR0	=	colpf0
COLOR1	=	colpf1
COLOR2	=	colpf2
COLOR3	=	colpf3

KOLM0PF	=	$D000		; kolizja pocisku 0 z polem gry (O)
KOLM1PF	=	$D001		; kolizja pocisku 1 z polem gry (O)
KOLM2PF	=	$D002		; kolizja pocisku 2 z polem gry (O)
KOLM3PF	=	$D003		; kolizja pocisku 3 z polem gry (O)
KOLP0PF	=	$D004		; kolizja gracza 0 z polem gry (O)
KOLP1PF	=	$D005		; kolizja gracza 1 z polem gry (O)
KOLP2PF	=	$D006		; kolizja gracza 2 z polem gry (O)
KOLP3PF	=	$D007		; kolizja gracza 3 z polem gry (O)
KOLM0P	=	$D008		; kolizja pocisku 0 z graczem (O)
KOLM1P	=	$D009		; kolizja pocisku 1 z graczem (O)
KOLM2P	=	$D00A		; kolizja pocisku 2 z graczem (O)
KOLM3P	=	$D00B		; kolizja pocisku 3 z graczem (O)
KOLP0P	=	$D00C		; kolizja gracza 0 z innym graczem (O)
KOLP1P	=	$D00D		; kolizja gracza 1 z innym graczem (O)
KOLP2P	=	$D00E		; kolizja gracza 2 z innym graczem (O)
KOLP3P	=	$D00F		; kolizja gracza 3 z innym graczem (O)
TRIG0	=	$D010		; stan przycisku joysticka 0 (O)
TRIG1	=	$D011		; stan przycisku joysticka 1 (O)
TRIG3	=	$D013		; znacznik do��czenia cartridge-a (O)
PAL	=	$D014		; znacznik systemu TV (O)

GTICTL	=	$D01B		; rejestr kontroli uk�adu GTIA
GTIACTL	=	gtictl

VDELAY	=	$D01C		; licznik op�nienia pionowego P/MG
PMCNTL	=	$D01D		; rejestr kontroli graczy i pocisk�w
HITCLR	=	$D01E		; rejestr kasowania rejestr�w kolizji
CONSOL	=	$D01F		; rejestr stanu klawiszy konsoli Start (bit 0), Select (bit 1), Option (bit 2) 

* ---------------------------------------------------------------------------------------------
* ---	POKEY
* ---------------------------------------------------------------------------------------------

IRQENS	=	$0010		; rejestr-cie� IRQEN
IRQSTAT	=	$0011		; rejestr-cie� IRQST

AUDF3	=	$D204		; cz�stotliwo�� pracy generatora 3 (Z)
AUDCTL	=	$D208		; rejestr kontroli generator�w d�wi�ku (Z)
STIMER	=	$D209		; rejestr zerowania licznik�w (Z)
KBCODE	=	$D209		; kod ostatnio naci�ni�tego klawisza (O)
SKSTRES	=	$D20A		; rejestr statusu z��cza szeregowego (Z)
RANDOM	=	$D20A		; rejestr liczby losowej (O)
SEROUT	=	$D20D		; szeregowy rejestr wyj�ciowy (Z)
SERIN	=	$D20D		; szeregowy rejestr wej�ciowy (O)
IRQEN	=	$D20E		; zezwolenie przerwa� IRQ (Z)
IRQST	=	$D20E		; status przerwa� IRQ (O)
SKCTL	=	$D20F		; rejestr kontroli z��cza szeregowego (Z)
SKSTAT	=	$D20F		; rejestr statusu z��cza szeregowego (O)

* ---------------------------------------------------------------------------------------------
* ---	PIA
* ---------------------------------------------------------------------------------------------
PORTA	=	$D300		; port A uk�adu PIA
PORTB	=	$D301		; port B uk�adu PIA
PACTL	=	$D302		; rejestr kontroli portu A
PBCTL	=	$D303		; rejestr kontroli portu B

* ---------------------------------------------------------------------------------------------
* ---	ANTIC
* ---------------------------------------------------------------------------------------------
DMACTL	=	$D400		; rejestr kontroli dost�pu do pami�ci
CHRCTL	=	$D401		; rejestr kontroli wy�wietlania znak�w
DLPTR	=	$D402		; adres programu ANTIC-a
HSCROL	=	$D404		; znacznik poziomego przesuwu obrazu
VSCROL	=	$D405		; znacznik pionowego przesuwu obrazu
PMBASE	=	$D407		; adres pami�ci graczy i pocisk�w
CHBASE	=	$D409		; adres zestawu znak�w
WSYNC	=	$D40A		; znacznik oczekiwania na synchronizacj� poziom�
VCOUNT	=	$D40B		; licznik linii obrazu
LPENH	=	$D40C		; poziome po�o�enie pi�ra �wietlengo
LPENV	=	$D40D		; pionowe po�o�enie pi�ra �wietlnego
NMIEN	=	$D40E		; rejestr zezwole� na przerwania NMI
NMIST	=	$D40F		; rejestr statusu przerwa� NMI

;-------------------------------------
;additional system variables
;-------------------------------------
COLPM0S = $02C0 ;- - rejestr-cie� COLPM0
COLPM1S = $02C1 ;- - rejestr-cie� COLPM1
COLPM2S = $02C2 ;- - rejestr-cie� COLPM2
COLPM3S = $02C3 ;- - rejestr-cie� COLPM3
COLPF0S = $02C4 ;- - rejestr-cie� COLPF0
COLPF1S = $02C5 ;- - rejestr-cie� COLPF1
COLPF2S = $02C6 ;- - rejestr-cie� COLPF2
COLPF3S = $02C7 ;- - rejestr-cie� COLPF3

COLBAKS = $02C8
GTICTLS = $026F ;- - rejestr-cie� GTIACTL

DMACTLS = $022F ;- - rejestr kontroli dost�pu do pami�ci - cie�
DLPTRS  = $0230 ;- - adres programu ANTIC-a - cie�
CHBAS   = $02F4 ;- - rejestr-cie� CHBASE
KBCODES = $02FC ;- - rejestr-cie� KBCODE

SETVBV  =   $E45C
XITVBV  =   $E462
SYSVBV  =   $E45F
RTCLOK  =   $0012

MEMTOP  =   $02E5 ;- - adres g�rnej granicy wolnej pami�ci RAM
MEMLO   =   $02E7 ;- - adres dolnej granicy wolnej pami�ci RAM

JSTICK0 = $0278 ;-  - po�o�enie joysticka 0
JSTICK1 = $0279 ;- JSTICK1 - po�o�enie joysticka 1
JSTICK2 = $027A ;- JSTICK2 - po�o�enie joysticka 0
JSTICK3 = $027B ;- JSTICK3 - po�o�enie joysticka 1
PTRIG0  = $027C ;- PTRIG0 - przycisk potencjometru 0
PTRIG1  = $027D ;- PTRIG1 - przycisk potencjometru 1
TRIG0S  = $0284 ;- TRIG0S - przycisk joysticka 0, rejestr-cie� TRIG0
TRIG1S  = $0285 ;- TRIG1S - przycisk joysticka 1, rejestr-cie� TRIG1
TRIG2S  = $0286 ;- TRIG2S - rejestr-cie� TRIG0
TRIG3S  = $0287 ;- TRIG3S - rejestr-cie� TRIG1


/*
Rejestry OS w pami�ci RAM

  $08 - WARMST - znacznik gor�cego startu
  $0E - APPMHI - najwy�szy adres RAM zaj�ty przez program
  $10 - IRQENS - rejestr-cie� IRQEN
  $11 - IRQSTAT - rejestr-cie� IRQST
  $12 - RTCLOK - zegar czasu rzeczywistego
  $15 - BUFADR - adres bufora dla operacji dyskowych
  $17 - ICCOMT - rejestr przej�ciowy kodu operacji I/O
  $20 - ZIOCB - zerostronicowy blok kontroli I/O
  $20 - ICHIDZ - indeks wpisu urz�dzenia w HATABS
  $21 - ICDNOZ - numer urz�dzenia
  $22 - ICCOMZ - kod operacji wej�cia/wyj�cia
  $23 - ICSTZ - status operacji wej�cia/wyj�cia
  $24 - ICBAZ - adres bufora danych dla operacji I/O
  $26 - ICPTZ - adres procedury obs�ugi dla operacji
  $28 - ICBLZ - d�ugo�� bufora danych dla operacji I/O
  $2A - ICAX1Z - rejestr pomocniczy ZIOCB
  $2B - ICAX2Z - rejestr pomocniczy ZIOCB
  $2C - ICAX3Z - rejestr pomocniczy ZIOCB
  $2D - ICAX4Z - rejestr pomocniczy ZIOCB
  $2E - ICAX5Z - rejestr pomocniczy ZIOCB
  $2F - ICAX6Z - rejestr pomocniczy ZIOCB
  $30 - STATUS - status aktualnej operacji SIO
  $31 - CHKSUM - suma kontrolna dla operacji SIO
  $32 - BUFR - adres bufora danych dla SIO
  $34 - BUFEN - adres ko�ca bufora danych dla SIO
  $36 - LTEMP - pomocniczy wektor odczytu listy liniowej
  $38 - BUFRFL - znacznik zape�nienia bufora SIO
  $39 - RECVND - znacznik ko�ca odczytu
  $3A - XMTDON - znacznik ko�ca transmisji
  $3B - CHKSNT - znacznik nadania sumy kontrolnej
  $3C - NOCKSM - znacznik braku sumy kontrolnej
  $3D - BPTR - licznik bufora magnetofonu
  $3E - GAPTYP - znacznik d�ugo�ci przerwy mi�dzy blokami
  $3F - FEOF - znacznik ko�ca zbioru
  $40 - FREQ - licznik d�wi�ku przy otwarciu magnetofonu
  $41 - IOSNDEN - znacznik d�wi�ku przy transmisji
  $42 - CRITIC - znacznik krytycznych czasowo operacji I/O
  $4A - ZCHAIN - rejestr nast�pstwa listy liniowej
  $4C - DSTAT - status klawiatury i ekranu
  $50 - TEMP - pomocniczy rejestr przej�ciowy
  $51 - HOLD1 - pomocniczy rejestr przej�ciowy
  $52 - LMARGIN - lewy margines obrazu
  $53 - RMARGIN - prawy margines obrazu
  $54 - ROWCRS - pionowa pozycja kursora
  $55 - COLCRS - pozioma pozycja kursora
  $57 - DINDEX - numer trybu graficznego OS
  $58 - SAVMSC - adres pami�ci obrazu
  $5A - OLDROW - poprzednia pionowa pozycja kursora
  $5B - OLDCOL - poprzednia pozioma pozycja kursora
  $5D - OLDCHR - poprzedni znak na ekranie
  $5E - OLDADR - poprzedni adres znaku na ekranie
  $60 - FKDEFP - wektor tabeli definicji klawiszy F1-F4
  $62 - PALNTS - wska�nik systemu TV
  $63 - LOGCOL - adres kursora w wierszu logicznym
  $64 - ADRESS - rejestr adresowy dla procedur edytora
  $66 - MLTTMP - pomocniczy rejestr przej�ciowy
  $68 - SAVADR - pomocniczy rejestr adresowy
  $6A - RAMTOP - liczba stron pami�ci RAM
  $6B - BUFCNT - licznik bufora edytora
  $6C - BUFSTR - adres bufora dla edytora
  $6E - BITMSK - maska bitowa do wy�wietlenia znaku
  $6F - SHFAMT - liczba przesuni�� punktu
  $70 - ROWAC - aktualny wiersz przy rysowaniu
  $72 - COLAC - aktualna kolumna przy rysowaniu
  $74 - ENDPT - znacznik ko�ca rysowanej linii
  $76 - DELTAR - przyrost pionowej pozycji kursora
  $77 - DELTAC - przyrost poziomej pozycji kursora
  $79 - KEYDEFP - wektor tabeli definicji klawiszy
  $7B - SWPFLG - znacznik kursora w trybach z oknem
  $7C - HOLDCH - przechowywanie warto�ci znaku
  $7D - INSDAT - rejestr pomocniczy edytora
  $7E - COUNTR - licznik pami�ci obrazu dla DOSCR i DRAW
$0100 - STACK - stos mikroprocesora 6502
$0200 - DLIV - wektor przerwania programu ANTIC-a
$0210 - VTIMR1 - wektor przerwania licznika 1 POKEY-a
$0212 - VTIMR2 - wektor przerwania licznika 2 POKEY-a
$0214 - VTIMR4 - wektor przerwania licznika 4 POKEY-a
$0218 - TIMCNT1 - pierwszy licznik systemu
$0226 - TIMVEC1 - wektor przerwania licznika TIMCNT1
$022A - TIMFLG3 - znacznik wyzerowania licznika TIMCNT3
$022F - DMACTLS - rejestr-cie� DMACTL
$0230 - DLPTRS - rejestr-cie� DLPTR
$0232 - SKCTLS - rejestr-cie� SKCTL
$0233 - LCOUNT - licznik odczytu dla nowego urz�dzenia
$0234 - LPENHS - rejestr-cie� LPENH
$0235 - LPENVS - rejestr-cie� LPENV
$023A - CDEVIC - kod urz�dzenia dla SIO
$023B - CCMND - kod operacji dla SIO
$023C - CAUX1 - pierwszy bajt pomocniczy dla SIO
$023D - CAUX2 - drugi bajt pomocniczy dla SIO
$023E - TEMP - tymczasowy rejestr odpowiedzi urz�dzenia
$023F - ERRFLG - znacznik b��du operacji SIO
$0244 - COLDST - znacznik zimnego startu systemu
$0245 - RECLEN - d�ugo�� rekordu z nowego urz�dzenia
$0246 - DSKTIM - warto�� Timeout dla stacji dysk�w
$0247 - PDVMSK - maska obecno�ci nowych urz�dze�
$0248 - PDVRS - rejestr-cie� PDVREG
$024A - RELADR - adres procedury przemieszczalnej
$024C - PPTMPA - rejestr przechowania zawarto�ci akumulatora
$024D - PPTMPX - rejestr przechowania zawarto�ci rejestru X
$026B - CHSPTR - wektor nieu�ywanego zestawu znak�w
$026C - VSFLAG - znacznik przesuwu pionowego obrazu
$026E - FINE - znacznik delikatnego przesuwu obrazu
$026F - GTICTLS - rejestr-cie� GTIACTL
$0270 - PADDL0 - rejestr-cie� POT0
$0278 - JSTICK0 - po�o�enie joysticka 0
$0279 - JSTICK1 - po�o�enie joysticka 1
$027A - JSTICK2 - po�o�enie joysticka 0
$027B - JSTICK3 - po�o�enie joysticka 1
$027C - PTRIG0 - przycisk potencjometru 0
$027D - PTRIG1 - przycisk potencjometru 1
$0284 - TRIG0S - przycisk joysticka 0, rejestr-cie� TRIG0
$0285 - TRIG1S - przycisk joysticka 1, rejestr-cie� TRIG1
$0286 - TRIG2S - rejestr-cie� TRIG0
$0287 - TRIG3S - rejestr-cie� TRIG1
$0288 - HIBYTE - indeks operacji nowego urz�dzenia
$0289 - WMODE - znacznik sposobu dost�pu do magnetofonu
$028A - BLIM - d�ugo�� bufora magnetofonu
$028E - NEWADR - adres procedury nowego urz�dzenia
$0290 - TXTROW - wiersz kursora w oknie tekstowym
$0291 - TXTCOL - kolumna kursora w oknie tekstowym
$0293 - TINDEX - tryb graficzny OS w oknie tekstowym
$0294 - TXTMSC - adres pami�ci okna tekstowego
$029C - CRETRY - liczba powt�rze� rozkazu operacji
$029D - HOLD3 - pomocniczy rejestr przej�ciowy
$029E - SUBTMP - pomocniczy rejestr przej�ciowy
$02A0 - DMASK - maska punkt�w obrazu
$02A2 - ESCFLG - znacznik klawisza ESC
$02A3 - TABMAP - mapa pozycji tabulacji
$02B2 - LOGMAP - mapa linii logicznych
$02B6 - INVFLG - znacznik klawisza inverse video
$02B7 - FILFLG - znacznik wype�niania obrazu
$02B8 - TMPROW - tymczasowy rejestr pozycji kursora
$02B9 - TMPCOL - tymczasowy rejestr pozycji kursora
$02BB - SCRFLG - znacznik przesuwu obrazu
$02BC - HOLD4 - pomocniczy rejestr przej�ciowy
$02BD - DRETRY - liczba powt�rze� wywo�a� urz�dzenia
$02BE - SHFLOK - znacznik klawiszy SHIFT i CONTROL
$02BF - BOTSCR - liczba wierszy tekstu
$02C0 - COLPM0S - rejestr-cie� COLPM0
$02C1 - COLPM1S - rejestr-cie� COLPM1
$02C2 - COLPM2S - rejestr-cie� COLPM2
$02C3 - COLPM3S - rejestr-cie� COLPM3
$02C4 - COLPF0S - rejestr-cie� COLPF0
$02C5 - COLPF1S - rejestr-cie� COLPF1 ;gr.8 letters
$02C6 - COLPF2S - rejestr-cie� COLPF2 ;gr.8 background
$02C7 - COLPF3S - rejestr-cie� COLPF3
$02C8 - COLBAKS - rejestr-cie� COLBAK
$02C9 - RUNADR - adres procedury nowego urz�dzenia
$02CB - HIUSED - adres ko�cowy procedury nowego urz�dzenia
$02CF - GBYTEA - adres procedury nowego urz�dzenia
$02D1 - LOADAD - adres wczytywania z nowego urz�dzenia
$02D3 - ZLOADA - pomocniczy rejestr adresu wczytywania
$02D5 - DSCTLN - d�ugo�� sektora dyskowego
$02DB - NOCLIK - znacznik d�wi�ku klawiatury
$02DE - PBPNT - licznik bufora drukarki
$02DF - PBUFSZ - d�ugo�� bufora drukarki
$02E5 - MEMTOP - adres g�rnej granicy wolnej pami�ci RAM
$02E7 - MEMLO - adres dolnej granicy wolnej pami�ci RAM
$02E9 - HNDLOD - znacznik relokowalnej procedury obs�ugi I/O
$02EA - DVSTAT - dodatkowy rejestr statusu urz�dzenia
$02EC - DVTMOT - dodatkowy rejestr Timeout urz�dzenia
$02ED - REVNUM - numer wersji nowego urz�dzenia
$02EE - CBAUD - pr�dko�� transmisji z magnetofonu
$02F0 - CRSINH - znacznik widoczno�ci kursora
$02F3 - CHACT - rejestr-cie� CHRCTL
$02F4 - CHBAS - rejestr-cie� CHBASE
$02F5 - NEWROW - nowa pozycja pionowa kursora
$02F6 - NEWCOL - nowa pozycja pozioma kursora
$02F8 - ROWINC - zmiana pionowej pozycji kursora
$02F9 - COLINC - zmiana poziomej pozycji kursora
$02FA - CHAR - kod wewn�trzny znaku
$02FB - ATACHR - kod ATASCII znaku
$02FC - KBCODES - rejestr-cie� KBCODE
$02FD - FILDAT - numer koloru dla wype�niania
$02FE - DSPFLG - znacznik wy�wietlania znak�w kontrolnych
$02FF - SSFLAG - znacznik start/stop dla przesuwu obrazu
$0300 - DDEVIC - kod identyfikacyjny urz�dzenia
$0301 - DUNIT - numer identyfikacyjny urz�dzenia
$0302 - DCMND - bajt rozkazu dla urz�dzenia
$0303 - DSTATS - status urz�dzenia
$0304 - DBUFA - adres bufora danych
$0306 - DTIMLO - warto�� Timeout dla urz�dzenia
$0308 - DBYT - d�ugo�� bufora danych
$030A - DAUX1 - rejestr pomocniczy dla operacji I/O
$030B - DAUX2 - rejestr pomocniczy dla operacji I/O
$030C - INTIM1 - rejestr czasu przy odczycie z magnetofonu
$030F - CASFLG - znacznik operacji z magnetofonem
$0310 - INTIM2 - rejestr czasu przy odczycie z magnetofonu
$0312 - TEMP1 - pomocniczy rejestr przej�ciowy
$0313 - TEMP2 - pomocniczy rejestr przej�ciowy
$0314 - PTIMOT - warto�� Timeout dla drukarki
$0315 - TEMP3 - pomocniczy rejestr przej�ciowy
$0316 - SAVIO - rejestr przej�ciowy dla operacji SIO
$0317 - TIMFLG - znacznik up�yni�cia czasu Timeout
$0318 - STACKP - rejestr wska�nika stosu dla SIO
$0319 - TSTAT - przej�ciowy rejestr statusu SIO
$031A - HATABS - tabela wektor�w procedur obs�ugi
$0340 - IOCB0 - blok kontroli I/O numer 0
$0350 - IOCB1 - blok kontroli I/O numer 1
$0360 - IOCB2 - blok kontroli I/O numer 2
$0370 - IOCB3 - blok kontroli I/O numer 3
$0380 - IOCB4 - blok kontroli I/O numer 4
$0390 - IOCB5 - blok kontroli I/O numer 5
$03A0 - IOCB6 - blok kontroli I/O numer 6
$03B0 - IOCB7 - blok kontroli I/O numer 7
$0340 - ICCHID - indeks wpisu urz�dzenia w HATABS
$0341 - ICDNO - numer urz�dzenia
$0342 - ICCMD - kod rozkazu operacji I/O
$0343 - ICSTAT - status operacji I/O
$0344 - ICBUFA - adres bufora danych dla operacji I/O
$0346 - ICPUTB - adres procedury przesy�ania danych
$0348 - ICBUFL - d�ugo�� bufora danych dla operacji I/O
$034A - ICAX1 - rejestr pomocniczy dla operacji I/O
$034B - ICAX2 - rejestr pomocniczy dla operacji I/O
$034C - ICAX3 - rejestr pomocniczy dla operacji I/O
$034D - ICAX4 - rejestr pomocniczy dla operacji I/O
$034E - ICAX5 - rejestr pomocniczy dla operacji I/O
$034F - ICAX6 - rejestr pomocniczy dla operacji I/O
$03C0 - PRNBUF - bufor drukarki
$03E8 - SUPERF - znacznik stosowany przy odczycie klawiatury
$03E9 - CKEY - znacznik klawisza START przy zimnym starcie
$03EC - DERRF - znacznik b��du przy otwieraniu edytora
$03FB - CHLINK  - rejestr element�w listy liniowej
$03FD - CSCB - bajty kontroli szybko�ci magnetofonu
$03FF - CRCB - bajt d�ugo�ci rekordu magnetofonowego
$0400 - CASBUF - bufor magnetofonu
$047F - CASBEN - koniec bufora magnetofonu
$D000 - HPOSP0 - pozioma pozycja gracza 0 (Z)
$D000 - KOLM0PF - kolizja pocisku 0 z polem gry (O)
$D001 - HPOSP1 - pozioma pozycja gracza 1 (Z)
$D001 - KOLM1PF - kolizja pocisku 1 z polem gry (O)
$D002 - HPOSP2 - pozioma pozycja gracza 2 (Z)
$D002 - KOLM2PF - kolizja pocisku 2 z polem gry (O)
$D003 - HPOSP3 - pozioma pozycja gracza 3 (Z)
$D003 - KOLM3PF - kolizja pocisku 3 z polem gry (O)
$D004 - HPOSM0 - pozioma pozycja pocisku 0 (Z)
$D004 - KOLP0PF - kolizja gracza 0 z polem gry (O)
$D005 - HPOSM1 - pozioma pozycja pocisku 1 (Z)
$D005 - KOLP1PF - kolizja gracza 1 z polem gry (O)
$D006 - HPOSM2 - pozioma pozycja pocisku 2 (Z)
$D006 - KOLP2PF - kolizja gracza 2 z polem gry (O)
$D007 - HPOSM3 - pozioma pozycja pocisku 3 (Z)
$D007 - KOLP3PF - kolizja gracza 3 z polem gry (O)
$D008 - SIZEP0 - poziomy rozmiar gracza 0 (Z)
$D008 - KOLM0P - kolizja pocisku 0 z graczem (O)
$D009 - SIZEP1 - poziomy rozmiar gracza 1 (Z)
$D009 - KOLM1P - kolizja pocisku 1 z graczem (O)
$D00A - SIZEP2 - poziomy rozmiar gracza 2 (Z)
$D00A - KOLM2P - kolizja pocisku 2 z graczem (O)
$D00B - SIZEP3 - poziomy rozmiar gracza 3 (Z)
$D00B - KOLM3P - kolizja pocisku 3 z graczem (O)
$D00C - SIZEM - poziomy rozmiar pocisk�w (Z)
$D00C - KOLP0P - kolizja gracza 0 z innym graczem (O)
$D00D - GRAFP0 - rejestr grafiki gracza 0 (Z)
$D00D - KOLP1P - kolizja gracza 1 z innym graczem (O)
$D00E - GRAFP1 - rejestr grafiki gracza 1 (Z)
$D00E - KOLP2P - kolizja gracza 2 z innym graczem (O)
$D00F - GRAFP2 - rejestr grafiki gracza 2 (Z)
$D00F - KOLP3P - kolizja gracza 3 z innym graczem (O)
$D010 - GRAFP3 - rejestr grafiki gracza 3 (Z)
$D010 - TRIG0 - stan przycisku joysticka 0 (O)
$D011 - GRAFM - rejestr grafiki pocisk�w (Z)
$D011 - TRIG1 - stan przycisku joysticka 1 (O)
$D012 - COLPM0 - rejestr koloru gracza i pocisku 0 (Z)
$D013 - COLPM1 - rejestr koloru gracza i pocisku 1 (Z)
$D013 - TRIG3 - znacznik do��czenia cartridge'a (O)
$D014 - COLPM2 - rejestr koloru gracza i pocisku 2 (Z)
$D014 - PAL - znacznik systemu TV (O)
$D015 - COLPM3 - rejestr koloru gracza i pocisku 3 (Z)
$D016 - COLPF0 - rejestr koloru pola gry 0 (Z)
$D017 - COLPF1 - rejestr koloru pola gry 1 (Z)
$D018 - COLPF2 - rejestr koloru pola gry 2 (Z)
$D019 - COLPF3 - rejestr koloru pola gry 3 (Z)
$D01A - COLBAK - rejestr koloru t�a (Z)
$D01B - GTIACTL - rejestr kontroli uk�adu GTIA
$D01C - VDELAY - licznik op�nienia pionowego P/MG
$D01D - PMCNTL - rejestr kontroli graczy i pocisk�w
$D01E - HITCLR - rejestr kasowania rejestr�w kolizji
$D01F - CONSOL - rejestr stanu klawiszy konsoli
$D1FF - PDVREG - rejestr wyboru nowego urz�dzenia
$D200 - AUDF1 - cz�stotliwo�� pracy generatora 1 (Z)
$D200 - POT0 - rejestr po�o�enia potencjometru 0 (O)
$D201 - AUDC1 - rejestr kontroli d�wi�ku generatora 1 (Z)
$D201 - POT1 - rejestr po�o�enia potencjometru 1 (O)
$D202 - AUDF2 - cz�stotliwo�� pracy generatora 2 (Z)
$D202 - POT2 - rejestr po�o�enia potencjometru 2 (O)
$D203 - AUDC2 - rejestr kontroli d�wi�ku generatora 2 (Z)
$D203 - POT3 - rejestr po�o�enia potencjometru 3 (O)
$D204 - AUDF3 - cz�stotliwo�� pracy generatora 3 (Z)
$D205 - AUDC3 - rejestr kontroli d�wi�ku generatora 3 (Z)
$D206 - AUDF4 - cz�stotliwo�� pracy generatora 4 (Z)
$D207 - AUDC4 - rejestr kontroli d�wi�ku generatora 4 (Z)
$D208 - AUDCTL - rejestr kontroli generator�w d�wi�ku (Z)
$D208 - POTST - status odczytu potencjometr�w (O)
$D209 - STIMER - rejestr zerowania licznik�w (Z)
$D209 - KBCODE - kod ostatnio naci�ni�tego klawisza (O)
$D20A - SKSTRES - reset statusu z��cza szeregowego (Z)
$D20A - RANDOM - rejestr liczby losowej (O)
$D20B - POTG0 - znacznik przetwornika analogowo-cyfrowego (Z)
$D20D - SEROUT - szeregowy rejestr wyj�ciowy (Z)
$D20D - SERIN - szeregowy rejestr wej�ciowy (O)
$D20E - IRQEN - zezwolenia przerwa� IRQ (Z)
$D20E - IRQST - status przerwa� IRQ (O)
$D20F - SKCTL - rejestr kontroli z��cza szeregowego (Z)
$D20F - SKSTAT - rejestr statusu z��cza szeregowego (O)
$D300 - PORTA - port A uk�adu PIA
$D301 - PORTB - port B uk�adu PIA
$D302 - PACTL - rejestr kontroli portu A
$D303 - PBCTL - rejestr kontroli portu B
$D400 - DMACTL - rejestr kontroli dost�pu do pami�ci
$D401 - CHRCTL - rejestr kontroli wy�wietlania znak�w
$D402 - DLPTR - adres programu ANTIC-a
$D404 - HSCROL - znacznik poziomego przesuwu obrazu
$D405 - VSCROL - znacznik pionowego przesuwu obrazu
$D407 - PMBASE - adres pami�ci graczy i pocisk�w
$D409 - CHBASE - adres zestawu znak�w
$D40A - WSYNC - znacznik oczekiwania na synchronizacj� poziom�
$D40B - VCOUNT - licznik linii obrazu
$D40C - LPENH - poziome po�o�enie pi�ra �wietlengo
$D40D - LPENV - pionowe po�o�enie pi�ra �wietlnego
$D40E - NMIEN - rejestr zezwole� na przerwania NMI
$D40F - NMIST - rejestr statusu przerwa� NMI
*/
