# Yay?l?m ve Hastane Analizi

Bu sayfa, salg?n?n yay?lma h?z?n? R de?eriyle; sa?l?k sistemi y?k?n? ise hastane ve yo?un bak?m hasta say?lar?yla g?sterir.

## ?l??ler

- **Hastane Verisi Veren ?lke**: `hosp_patients` i?in en az bir kay?t g?ndermi? benzersiz ?lke say?s?d?r.
- **YB? Verisi Veren ?lke**: `icu_patients` i?in en az bir kay?t g?ndermi? benzersiz ?lke say?s?d?r.
- **R Son G?zlem Tarihi**: `reproduction_rate` bulunan son tarihtir.
- Hastane ve YB? grafi?i, se?ili t?r?n `*_patients_per_million` g?nl?k ortalamas?n? g?sterir.

## Yorumlama

- **R > 1** salg?n?n b?y?d???n?, **R = 1** sabit kald???n?, **R < 1** ise geriledi?ini g?sterir.
- Grafikteki R=1 ?izgisi kar??la?t?rma referans?d?r; tahmin ?izgisi de?ildir.
- R verisi 02.01.2023 tarihinde sona erer. Bu tarihten sonras? bo? kalmal?d?r.
- Hastane ve YB? de?erleri yaln?z o tarihte veri payla?an ?lkelerin ortalamas?d?r. Bo? kay?tlar s?f?r kabul edilmez.

## Kontrol senaryolar?

| Se?im | Beklenen sonu? |
| --- | --- |
| Germany, 02.01.2023 | R yakla??k 1,18 ve R=1 ?izgisinin ?zerinde |
| United States, Ekim 2021 | R, hastane ve YB? grafikleri dolu |
| Albania, t?m d?nem | R grafi?i dolu; hastane ve YB? kartlar?/grafi?i bo? |
