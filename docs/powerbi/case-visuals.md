# Vaka analizi görsel düzeni

Sayfa, kıta, ülke ve tarih aralığı seçicileriyle filtrelenir. Tarih seçicisi `Between` türünde çalışır ve 2020-01-01 – 2024-08-14 arasındaki veriyi süzer.

1. KPI kartları: dönemlik yeni vaka, kümülatif vaka, milyon kişi başına vaka ve eksik gün sayısını gösterir.
2. Yıllara göre aylık yeni vaka karşılaştırması: `new_cases` toplamını ay ekseninde, yıl lejantında gösterir. Bu görünüm günlük kayıtlardaki yoğun sıfır değerler yerine yıllar arası aylık karşılaştırmayı destekler.
3. Ülkelere göre yeni vaka sıralaması: seçili bağlamda en yüksek dönemlik yeni vakaya sahip ilk 10 ülkeyi gösterir.
4. Doldurulmuş dünya haritası: ülkeleri dönemlik yeni vaka sayısına göre renklendirir. Haritadaki manuel lejant, renk aralıklarını açıklar.

Haritada gri taban üzerinde açık pembe–koyu bordo ölçeği kullanılır. Tooltip, ülke üzerindeki dönemlik yeni vaka değerini gösterir.
