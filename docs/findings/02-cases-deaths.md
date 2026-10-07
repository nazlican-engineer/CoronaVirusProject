# Vaka ve Ölüm Yükü
## Vaka Bulguları ve Kararları

Vaka Bulguları ve Kararları
- Temizlenmiş ülke verileri kullanıldı. Veri setinde 194 ülkeye ait 324.819 satır ve 67 sütun bulunduğu görüldü. Tarihler 1 Ocak 2020–14 Ağustos 2024 aralığındadır.
- Ülke–tarih tekrarları kontrol edildi. Temizlenmiş ülke tablosunda tekrar eden ülke–tarih kaydı bulunmadı.
- total_cases sütunundaki eksik kayıtlar incelendi. Kısmen eksik verisi bulunan ülkelerde boşlukların ilk dolu kayıttan önce veya son dolu kayıttan sonra bulunduğu görüldü.
- Kümülatif vaka sayısındaki azalmalar kontrol edildi. 16 ülke–tarih kaydında total_cases değerinin önceki kayda göre azaldığı tespit edildi.
- Azalma tarihlerindeki günlük vaka kayıtları incelendi. Bu 16 kaydın tamamında new_cases değerinin boş olduğu görüldü. Bu durum, boş değerlerin azalmaya neden olduğunu kanıtlamaz. Azalmaların nedeni doğrulanmadığı için kaynak değerler korundu.
- new_cases sütunundaki eksikler sınıflandırıldı. Başlangıçta, veri akışının ortasında ve sonda bulunan boşluklar ayrıldı. 16 ülkede dolu kayıtların arasında birer günlük boşluk bulundu.
- Negatif günlük yeni vaka değerleri kontrol edildi. Yapılan kontrolde negatif new_cases kaydı bulunmadı.
- Haftalık yeni vaka toplamları oluşturuldu. Günlük kayıtlar pazartesi–pazar dönemlerine ayrıldı ve mevcut günlük vaka değerleri toplandı. Tamamen boş haftaların toplamı NaN olarak korundu.
- Haftaların veri kapsamı belirlendi. Her hafta için kayıtlı gün, dolu gün ve eksik gün sayıları hesaplandı. Yedi günlük vaka verisi dolu olan haftalar “tam hafta” olarak işaretlendi.
- Eksik haftaların gösterim kuralı belirlendi. Eksik haftalarda mevcut günlerin toplamının, eksiklik açıklamasıyla birlikte gösterilmesine karar verildi. Hiç dolu kaydı olmayan haftalar “Veri yok” olarak etiketlendi.
- Haftalık değişim hesaplandı. Artış ve azalışlar yalnızca birbirini izleyen iki tam hafta arasında hesaplandı. Önceki haftanın toplamı sıfır olduğunda yüzde değişim hesaplanmadı.
- Nüfus bilgisi kontrol edildi. Eksik, sıfır veya negatif nüfus değeri bulunmadı. Aynı ülke içinde farklı nüfus değerine rastlanmadı.
- Milyon kişi başına haftalık yeni vaka hesaplandı. Ülkelerin nüfus farklarını hesaba katmak için haftalık vaka toplamı nüfusa bölünüp bir milyonla çarpıldı. Son tablodaki bu gösterge yalnızca tam haftalar için tutuldu.
- Türkiye’nin haftalık ve kümülatif vaka eğilimleri incelendi. Son dönemde yeni vakaların çoğunlukla sıfır olması, kümülatif toplamın yaklaşık 17 milyon seviyesinde yatay ilerlemesiyle uyumlu bulundu. Bu durum gerçek vaka oluşumunun tamamen durduğunu göstermez.
- 4 Ağustos 2024 tarihli ülke karşılaştırması yapıldı. Toplam vakada ABD, Çin ve Hindistan; milyon kişi başına toplam vakada Brunei, San Marino ve Avusturya ilk üç sırada yer aldı. Nüfusa göre hesaplama ülke sıralamasını değiştirdi.
- Ortak hafta için veri kapsamı incelendi. 8–14 Mayıs 2023 haftasında 194 ülkenin tamamında yedi günlük yeni vaka kaydı doluydu. Bu hafta için milyon kişi başına yeni vaka karşılaştırması hazırlandı. Dolu kayıtların bulunması, raporlamanın güncel olduğunu tek başına kanıtlamaz.
- Hafta sonundaki kümülatif vaka değerleri eklendi. Her ülkenin pazar günündeki total_cases değeri alındı. Kümülatif değerler haftalık olarak toplanmadı; pazar değeri bulunamadığında eksik bırakıldı.
- Dashboard için haftalık çıktı tablosu hazırlandı. Mevcut vaka toplamı, veri kapsamı, haftalık değişimler, nüfusa göre vaka değeri ve hafta sonu kümülatif toplamı aynı tabloda birleştirildi.

![Vaka karşılaştırması](../figures/01-vaka-karsilastirma.png)
## Türkiye'de Vaka Eğrileri

![Türkiye haftalık yeni vaka](../figures/01a-turkiye-haftalik-vaka.png)

Türkiye'de haftalık yeni vaka sayısı 2022 başında en yüksek seviyeye ulaşır. 2023 sonrasında serinin sıfıra yaklaşması, bu dönemde düzenli vaka bildiriminin sona erdiğini gösterir; sıfır vaka anlamına gelmez.

![Türkiye kümülatif vaka](../figures/01b-turkiye-kumulatif-vaka.png)

Kümülatif vaka eğrisi yalnızca yukarı yönlü ilerler. Eğrinin dikleştiği dönemler, yeni vaka bildirimlerinin hızlandığı dalgalardır.

![Milyon kişi başına haftalık vaka](../figures/01d-haftalik-vaka-milyon-basina.png)

8–14 Mayıs 2023 haftasında Brunei başta olmak üzere küçük nüfuslu ülkeler milyon kişi başına haftalık vakada üst sıradadır. Bu görsel, toplam sayı ile nüfusa göre ölçünün farklı sıralamalar ürettiğini gösterir.


> **Hesaplama yaklaşımı:** Günlük vaka sayıları haftalara toplanır. Bir haftada gün eksikse bu hafta ülkeler arası karşılaştırmada kullanılmaz.

4 Ağustos 2024 itibarıyla bildirilen toplam vaka sayısında Amerika Birleşik Devletleri, Çin ve Hindistan öne çıkar. Milyon kişi başına hesaplama ise nüfus büyüklüğünün etkisini azaltır ve sıralamayı değiştirebilir. Bu nedenle dashboard'da mutlak değerler ile kişi başına ölçüler birlikte sunulur.

## Ölüm Bulguları ve Kararları

- Temizlenmiş ülke verileri kullanıldı. Analizde yalnızca ülkeler yer aldı; ülke-tarih tekrarları temizlenmiş veri dosyasında bulunmamaktadır.

- `total_deaths` sütununun veri kapsamı incelendi. Kısmen eksik kümülatif ölüm kayıtlarındaki boşluklar veri akışının başında veya sonunda bulunmuştur. Dolu ölüm kayıtlarının arasında eksik `total_deaths` kaydı tespit edilmemiştir.

- Kümülatif ölüm sayısındaki azalmalar kontrol edildi. 9 ülke-tarih kaydında `total_deaths` değerinin önceki kayda göre azaldığı görüldü.

- Kümülatif ölümün azaldığı 9 tarihin tamamında `new_deaths` değeri eksikti. Bu birliktelik, eksik günlük ölüm kaydının azalmanın nedeni olduğunu kanıtlamaz. Azalmaların kaynak düzeltmesi veya veri sorunu olup olmadığı doğrulanmadığı için kaynak değerler korundu.

- `new_deaths` sütunundaki eksik kayıtlar başta, arada ve sonda olarak sınıflandırıldı. Australia, Canada, Chile, China, Indonesia, Panama, Papua New Guinea, Sierra Leone ve Thailand için dolu kayıtların arasında birer günlük eksik ölüm kaydı bulundu.

- Negatif `new_deaths` kaydı bulunmadı.

- Günlük yeni ölüm kayıtları pazartesi–pazar dönemlerine göre haftalık olarak gruplandı. Her ülke ve hafta için mevcut ölüm toplamı, dolu gün sayısı ve eksik gün sayısı hesaplandı.

- Tam haftalar, eksik gün içeren haftalar ve hiç veri bulunmayan haftalar `veri_durumu` sütunuyla etiketlendi. Eksik haftalarda yalnızca mevcut günlerin toplamı korundu; bu değer tam haftanın toplamı gibi yorumlanmadı.

- Haftalık ölüm farkı ve yüzde değişimi yalnızca birbirini izleyen iki tam hafta için hesaplandı. Önceki haftanın ölüm toplamı sıfır olduğunda yüzde değişimi boş bırakıldı.

- Haftalık ölüm değerleri milyon kişi başına hesaplandı. Eksik haftalardaki mevcut gün toplamı ile yalnızca tam haftalara ait güvenilir karşılaştırma değeri ayrı sütunlarda tutuldu.

- Her haftanın pazar günündeki `total_deaths` değeri hafta sonu kümülatif ölüm olarak eklendi. Kümülatif ölüm değerleri haftalık olarak toplanmadı.

- Türkiye için haftalık bildirilen ölüm ve kümülatif ölüm eğrileri incelendi. Eksik haftalar grafikte ayrı işaretlenebilecek biçimde hazırlandı.

- 4 Ağustos 2024 tarihinde toplam bildirilen ölüm sayısında ABD, Brezilya ve Hindistan; milyon kişi başına toplam ölümde Peru, Bulgaristan ve Kuzey Makedonya ilk sıralarda yer aldı. Nüfusa göre hesaplama ülke sıralamasını değiştirmektedir.

- Ortak hafta için veri kapsamı incelendi. 19–25 Haziran 2023 haftasında 194 ülkenin tamamında yedi günlük ölüm verisi bulundu. Bu hafta için milyon kişi başına haftalık ölüm karşılaştırması hazırlandı.

- Dashboard için `weekly_deaths.csv` tablosu oluşturuldu. Bu tablo; mevcut ölüm toplamı, veri durumu, haftalık değişim, milyon kişi başına değerler ve hafta sonu kümülatif ölüm bilgisini içerir.

- Fazla ölüm verisi, dashboard planında yer almadığı için bu projenin analiz kapsamına alınmadı.

![Ölüm karşılaştırması](../figures/02-olum-karsilastirma.png)
## Türkiye'de Ölüm Eğrileri

![Türkiye haftalık yeni ölüm](../figures/02a-turkiye-haftalik-olum.png)

Türkiye'de haftalık yeni ölüm grafiği, tam hafta ve eksik gün içeren haftaları ayırır. En yüksek ölüm dalgaları 2021 ile 2022 başında görülür.

![Türkiye kümülatif ölüm](../figures/02b-turkiye-kumulatif-olum.png)

Kümülatif ölüm eğrisindeki hızlı yükselişler salgın dalgalarıyla ilişkilidir. Son dönemdeki yataylaşma, bildirilen ölüm sayısındaki artışın azalmasını gösterir.

![Milyon kişi başına haftalık ölüm](../figures/02d-haftalik-olum-milyon-basina.png)

19–25 Haziran 2023 haftasında milyon kişi başına yeni ölüm sıralaması, toplam ölüm sayısından farklı ülkeleri öne çıkarır. Bu nedenle ölüm yükünü nüfusa göre de incelemek gerekir.


> **Hesaplama yaklaşımı:** Eksik günler sıfır ölüm olarak gösterilmez. Haftalık değişim yalnızca verisi tam olan iki hafta arasında hesaplanır.

Aynı ayrım ölüm verisinde de görülür. Mutlak bildirilen ölüm sayısında büyük nüfuslu ülkeler öne çıkarken, milyon kişi başına ölüm sıralaması Peru, Bulgaristan ve Kuzey Makedonya gibi farklı ülkeleri öne taşır. Bu görseller bildirilen sonuçları gösterir; veri kapsamı ve raporlama farklılıkları nedeniyle tek başına salgın yönetiminin başarısını ölçmez.
