# COVID-19 Dashboard

Power BI Desktop ile haz?rlanm??, ?lkeler aras? COVID-19 vaka, ?l?m, hastane, test, a??lama ve demografik g?stergeleri inceleyen etkile?imli rapor.

## Rapor sayfalar?

| Sayfa | Yan?tlad??? soru |
| --- | --- |
| Vaka Analizi | Vakalar zaman i?inde ve ?lkeler aras?nda nas?l de?i?ti? |
| ?l?m Analizi | ?l?mler, ?l?m oran? ve n?fusa g?re ?l?m y?k? nas?l de?i?ti? |
| Yay?l?m ve Hastane | R de?eri ile hastane/YB? g?stergeleri nas?l seyretti? |
| Test Analizi | Test yo?unlu?u ve pozitiflik oran? nas?l de?i?ti? |
| A?? Analizi | A??lanma, vaka ve ?l?m e?rileriyle birlikte nas?l ilerledi? |
| Demografik ve Ekonomik Analiz | Sa?l?k y?k?, demografik ve ekonomik g?stergelerle nas?l ili?kilendi? |

## Kullan?m

Her sayfada ayn? ?? dilimleyici bulunur:

- **K?ta**: `continent`
- **?lke**: `location`
- **Zaman Aral???**: `Takvim[Date]`

Bu dilimleyiciler rapor sayfalar? aras?nda senkronlan?r. Tek ?lke se?imi, o ?lkenin veri kapsad??? g?rselleri g?nceller; kaynakta ilgili g?sterge bulunmuyorsa de?er s?f?r yerine bo? g?r?n?r.

## Veri ve model

- Ana tablo: `countries_clean`
- Takvim tablosu: `Takvim`
- ?li?ki: `Takvim[Date]` ? `countries_clean[date]`
- Power BI raporu: `dashboard/covid19_dashboard.pbix`

K?m?latif vaka, ?l?m ve test de?erleri ?lkelerin son bildirilen toplamlar?n?n toplanmas?yla hesaplan?r. G?nl?k metrikler se?ili tarih aral???ndaki bildirilen de?erleri toplar. ?lke n?fuslar?na g?re kar??la?t?r?lan de?erlerde milyon ki?i ba??na oranlar kullan?l?r.

## Veri kalitesi ilkeleri

- Bo? kay?tlar **s?f?r kabul edilmez**.
- Hastane, YB?, test ve R g?stergelerinde ?lkelerin veri kapsam? farkl?d?r.
- R verisi kaynakta **02.01.2023** tarihinde biter.
- Test verisi kaynakta **23.06.2022** tarihinde biter.
- Test s?ralamas? yaln?z `tests performed` birimini kullanan ?lkeleri i?erir.
- A?? oran? zaman serileri, farkl? g?nlerde raporlama yapan ?lkelerin son bilinen de?erleriyle hesaplan?r.
- G?rseller ili?kiyi g?sterir; tek ba??na neden-sonu? kan?t? de?ildir.

## Do?rulama

Rapor; t?m ?lkeler, tek ?lke, tarih aral??? ve eksik kay?t senaryolar?yla kontrol edilir. ?rnek olarak Afghanistan se?ildi?inde hastane/YB? verisi bo? kal?rken R, vaka, ?l?m, test, a?? ve demografik g?rseller ilgili ?lkeye g?re g?ncellenir.

Sayfa bazl? y?ntem ve do?rulama notlar? `docs/powerbi` klas?r?ndedir.
