# Ölüm Analizi Ölçüleri

Ölüm Analizi sayfası, aktif ülke, kıta ve tarih filtrelerine uyan kayıtları kullanır.

| Kart | Ölçü | Tam veri görünümündeki değer |
| --- | --- | ---: |
| Dönemlik Yeni Ölüm | `SUM(new_deaths)` | 7.048.183 |
| Kümülatif Ölüm | Her ülkenin son `total_deaths` değeri | 7.046.085 |
| Milyon Kişi Başına Ölüm | Toplam ölüm / toplam nüfus × 1.000.000 | 884,20 |
| Bildirilen Ölüm Oranı | Kümülatif ölüm / kümülatif vaka | %0,9 |

`Milyon kişi başına ölüm` toplam görünümde ülke oranlarının toplamı veya ortalaması değildir. Ölçü, filtre bağlamındaki toplam ölüm ve toplam nüfusu kullanır.

```DAX
Milyon kişi başına ölüm =
DIVIDE(
    [Kümülatif ölüm],
    SUMX(
        VALUES('countries_clean'[location]),
        CALCULATE(MAX('countries_clean'[population]))
    ),
    0
) * 1000000
```
