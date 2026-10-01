# Vaka sayfası ölçüleri

- **Dönemlik yeni vaka**: seçili tarih, ülke ve kıta bağlamındaki `new_cases` toplamı.
- **Kümülatif vaka**: her seçili ülkenin en yüksek `total_cases` değeri.
- **Milyon kişi başına vaka**: kümülatif vaka / seçili ülke nüfusu × 1.000.000.
- **Eksik gün**: seçili takvim günlerinde `new_cases` değeri boş olan gün sayısıdır; sıfır vaka eksik sayılmaz.

Tarih filtresi `Takvim[Hafta Etiketi]` üzerinden uygulanır. Bu filtre tüm vaka KPI'larını ve görselleri günceller.
