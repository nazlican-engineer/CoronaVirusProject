# SQL ile Veri Doğrulama ve Analiz Yaklaşımı

SQL, Python ile hazırlanan temiz ve haftalık tabloların PostgreSQL içinde kontrol edilmesi ve tekrar analiz edilmesi için kullanılır. Sorguların tamamı [sql/03_analysis_queries.sql](../sql/03_analysis_queries.sql) dosyasındadır.

### Tablo Yapısı

- [01_create_schema.sql](../sql/01_create_schema.sql), proje tablolarını ayrı bir COVID şemasında tutar.
- [02_create_tables.sql](../sql/02_create_tables.sql), günlük temiz ülke verisi ile haftalık vaka, ölüm, test ve aşı tablolarını oluşturur.
- Günlük countries_clean tablosunda location + date birincil anahtardır. Böylece aynı ülke ve tarih için ikinci bir kayıt eklenemez.
- Haftalık tablolarda eksik gün, dolu gün, tam hafta ve veri durumu alanları korunur. Böylece analizde hangi kayıtların güvenle karşılaştırıldığı görülür.

### Önce Kontrol, Sonra Karşılaştırma

SQL sorguları önce kayıt sayısını, ülke sayısını, tarih aralığını, tekrar eden kayıtları ve her değişkenin veri kapsamını kontrol eder. Bu adım, notebook'ta hazırlanan temiz tabloların PostgreSQL'e doğru aktarıldığını doğrular.

Haftalık sonuçlarda yalnızca tam hafta verisi kullanılır. Bir ülkede haftanın bir günü eksikse o ülke o haftanın küresel toplamına katılmaz. Bu nedenle “en yüksek küresel hafta” sonuçları, tüm ülkelerin değil **tam veri bildiren ülkelerin kaydedilen toplamını** gösterir.

### Vaka ve Ölüm Sorgularında İzlenen Yol

- Vaka ve ölüm için önce en yüksek küresel haftalar bulundu.
- Aynı haftada ülkelerin dünya toplamındaki payı hesaplandı.
- Mutlak toplamların yanında milyon kişi başına değerler de sıralandı; böylece nüfus etkisi azaltıldı.
- Çok küçük ülkelerin aşırı değerlerle sıralamayı bozmasını azaltmak için bazı zirve karşılaştırmalarında nüfusu en az 1 milyon olan ülkeler kullanıldı.
- Çin'in Aralık 2022'deki sıra dışı vaka haftası önce tek başına incelendi, ardından Çin hariç küresel karşılaştırma yapıldı.
- Şili ve Ekvador'daki ani ölüm sıçramaları günlük kayıtlarla kontrol edildi.
- Tek haftalık toplu bildirimlerin etkisini azaltmak için ülkelerin 4 haftalık hareketli ortalama ölüm yükü de hesaplandı.

### Test Verisi Kararı

Test verisinde yapılan test sayısı, test edilen kişi sayısı ve örnek sayısı aynı ölçü değildir. Bu yüzden ham test toplamları bütün ülkeler arasında doğrudan karşılaştırılmadı. Ortak test sıralamalarında yalnızca **yapılan test sayısı** birimini kullanan ülkeler seçildi.

Test ile vakayı doğrudan bölerek bulunan “100 test başına vaka” sonucu bazı ülkelerde 100'ü aşabildi. Test ve vaka bildirimleri aynı kişiyi veya aynı raporlama zamanını temsil etmediği için bu ölçü güvenilir kabul edilmedi. Bunun yerine kaynaktan gelen pozitiflik oranı, günlük test yoğunluğu ve kayıtlı gün sayısı birlikte değerlendirildi.

### Aşı Karşılaştırması Kararı

Aşı oranları her ülkede her gün yayımlanmadığı için, her hafta ülkenin son geçerli aşı gözlemi kullanıldı. Boş günler sıfır aşılanma olarak yorumlanmadı.

Ülkeler, ortak veri kapsamının yüksek olduğu 6 Eylül 2021 haftasında tam aşılama oranına göre düşük, orta ve yüksek grup olarak ayrıldı. Sonraki 12 haftadaki milyon kişi başına ölüm oranları karşılaştırıldı. Orta kapsama grubunun düşük kapsama grubundan daha yüksek çıkması; yaş yapısı, dalganın zamanı, sağlık sistemi ve eksik bildirim gibi başka etkenlerin sonucu etkilediğini gösterir. Bu analiz nedensellik kanıtı değildir.


---
