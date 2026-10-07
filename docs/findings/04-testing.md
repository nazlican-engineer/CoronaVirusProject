# Test Verisinin Yorumu
## Bulgular ve Kararlar

### Veri Kapsamı ve Test Birimleri

- `total_tests` 172 ülkede, `new_tests` 142 ülkede, `new_tests_smoothed` 169 ülkede ve `positive_rate` 162 ülkede bulunmaktadır.
- Test birimi bilgisi 176 ülkede vardır.
- 138 ülke `tests performed`, 23 ülke `people tested`, 14 ülke `samples tested` ve 1 ülke `units unclear` test birimini kullanmaktadır.
- Hiçbir ülkede zaman içinde birden fazla test birimi görülmemiştir. Bu nedenle her ülkenin kendi zaman serisinde test ölçüm birimi tutarlıdır.
- Farklı test birimleri aynı ölçümü temsil etmediği için ham `total_tests` ve `new_tests` değerleri bütün ülkeler arasında doğrudan karşılaştırılmamalıdır.

### Toplam ve Günlük Test Verisi

- `total_tests` kümülatif test sayısında azalış görülmemiştir. Test verisi bulunan dönemlerde kümülatif toplamlar mantıksal olarak artmaktadır.
- `total_tests` ve `new_tests` boşluklarının çoğu veri serisinin başlangıç veya bitiş döneminde bulunur. Aktif raporlama dönemindeki boşluklar sınırlıdır.
- `new_tests` alanında negatif değer bulunmamıştır.
- `new_tests` verisi bulunan 142 ülkenin 122’sinde kayıtlar çoğunlukla günlük aralıklarla paylaşılmıştır.
- Daha seyrek raporlama yapan veya yalnızca az sayıda test kaydı bulunan ülkeler de vardır. Bu nedenle haftalık test toplamları yalnızca 7 günün tamamında `new_tests` verisi bulunan haftalar için hesaplanmıştır.
- Eksik gün içeren haftalar sıfırla doldurulmamış, `tam_hafta` ve `veri_durumu` alanlarıyla etiketlenmiştir.

### Pozitiflik Oranı ve Test/Vaka Oranı

- `positive_rate` değerlerinin tamamı 0–1 aralığındadır; mantıksal sınır dışında değer bulunmamıştır.
- Pozitiflik oranı eksikliklerinin çoğu raporlamanın başlangıç veya bitiş dönemindedir. Aktif dönem içindeki boşluklar sınırlı olduğundan seçili ülke zaman grafikleri için uygundur.
- `tests_per_case` alanında sıfır veya negatif değer bulunmamıştır.
- Seçili ülke örneğinde bazı dönemlerde test yoğunluğu düşerken pozitiflik oranı yükselmiştir. Bu durum testlerin daha çok riskli kişilere uygulanması, test kapasitesi veya artan bulaş ile ilişkili olabilir; grafik tek başına nedensellik göstermez.

### Ülkeler Arası Karşılaştırma ve Dashboard

- Pozitiflik oranı, ham test sayısına göre ülkeler arasında daha uygun bir karşılaştırma göstergesidir.
- En fazla ortak pozitiflik oranı bulunan tarih 20 Mart 2022’dir; bu tarihte 136 ülkenin pozitiflik oranı bulunmaktadır.
- Karşılaştırma grafiğinde yalnızca `tests performed` kullanan 107 ülke kullanılmıştır.
- Seçili ülke zaman grafiğinde milyon kişi başına düzeltilmiş test yoğunluğu ile pozitiflik oranı ayrı panellerde gösterilmiştir.
- Dashboard için `weekly_tests.csv` tablosu oluşturulmuştur. Haftalık test kartı yalnızca `tam_hafta = True` olan kayıtlarda kullanılmalıdır.
- Test birimi, veri durumu ve son gözlem tarihi dashboard’da kullanıcıya gösterilmelidir.

![Birleşik Arap Emirlikleri test ve pozitiflik serisi](../figures/04-bae-test-pozitiflik.png)
## Pozitiflik Oranı Karşılaştırması

![En yüksek test pozitiflik oranları](../figures/04b-pozitiflik-orani-karsilastirma.png)

20 Mart 2022'de en yüksek pozitiflik oranları Gürcistan ve Hollanda'da görülür. Pozitiflik oranı test yoğunluğu ve raporlama kapsamıyla birlikte yorumlanmalıdır.


> **Hesaplama yaklaşımı:** Ülkeler arası karşılaştırmada yalnızca yapılan test sayısını bildiren ülkeler kullanılır. Eksik günler doldurulmaz.

Test yoğunluğu ve pozitiflik oranı her ülkede aynı sıklıkta bildirilmez. Bu örnek, test serisindeki değişimleri ve pozitiflik bildirimindeki kesintileri görünür kılar. Ülkeler arası test karşılaştırmalarında yalnızca `tests performed` birimi kullanan ülkeler değerlendirilir; kişi ya da örnek sayısı olarak bildiren veriler aynı ölçeği temsil etmez.
