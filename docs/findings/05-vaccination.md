# Aşılama, Vaka ve Ölüm Eğrileri
## Bulgular ve Kararlar

- Temizlenmiş ülke verileri kullanıldı. Aşı analizi, `countries_clean.csv` içindeki ülke bazlı kayıtlara dayanır.

- Toplam doz, en az bir doz olan kişi, tam aşılı kişi, booster ve aşı oranı sütunlarının ülke bazındaki veri kapsamı incelendi.

- Tam aşılama oranı verisinin birçok ülkede günlük ve kesintisiz yayımlanmadığı görüldü. Eksik kayıtlar başlangıçta, veri akışının arasında ve sonunda bulunabilmektedir.

- Eksik aşı oranları sıfırla doldurulmadı. Boş kayıt, o gün hiç aşılama yapılmadığı şeklinde yorumlanmadı.

- Negatif toplam doz, ilk doz kişi, tam aşılı kişi veya booster kaydı bulunmadı.

- Tam aşılı kişi sayısının en az bir doz olmuş kişi sayısını geçtiği mantıksal olarak çelişkili kayıt bulunmadı.

- `total_vaccinations`, `people_vaccinated`, `people_fully_vaccinated` ve `total_boosters` sütunlarında zaman içinde azalma tespit edilmedi.

- Günlük düzenli kayıt şartı yerine, her ülke için haftalık aşı gözlem tablosu oluşturuldu.

- Her haftada hem ilk doz hem tam aşılama oranının birlikte bulunduğu son kayıt `gozlem_tarihi` olarak seçildi. Bu gözlemin hafta sonuna göre gecikmesi `gozlem_gecikmesi_gun` sütununda tutuldu.

- Bir haftada iki aşı oranı birlikte bulunmuyorsa oranlar boş bırakıldı ve `veri_durumu` alanında “Aşı oranı verisi yok” olarak işaretlendi.

- Ortak haftada ilk doz ve tam aşılama oranları ülkeler arasında karşılaştırıldı. Karşılaştırmada yalnızca iki oranı da bulunan ülkeler kullanıldı.

- Türkiye için aşılama oranı, haftalık yeni vaka ve haftalık yeni ölüm eğrileri aynı zaman ekseninde gösterildi. Bu grafikler zaman içindeki beraber değişimi gösterir; tek başına nedensel etki kanıtlamaz.

- Dashboard için `weekly_vaccinations.csv` tablosu oluşturuldu. Tablo; haftalık aşı oranlarını, gerçek gözlem tarihini, gözlem gecikmesini ve veri durumunu içerir.

![Türkiye'de aşılama, vaka ve ölüm eğilimleri](../figures/05-turkiye-asi-vaka-olum.png)
## Aşı Kapsamı ve İlerleyişi

![Ülkelere göre aşı kapsamı](../figures/05a-asi-kapsami-karsilastirma.png)

6–12 Eylül 2021 haftasında Birleşik Arap Emirlikleri ve Katar en az bir doz ile tam aşılı oranlarında üst sıradadır. Mavi çubuk en az bir doz, yeşil çubuk tam aşılı oranını gösterir.

![Türkiye aşı ilerleyişi](../figures/05b-turkiye-asi-ilerlemesi.png)

Türkiye'de en az bir doz ve tam aşılı oranı 2021 boyunca yükselir, ardından yataylaşır. Serideki boşluklar veri eksikliğidir; sıfır aşılama değildir.


> **Hesaplama yaklaşımı:** Her hafta için ülkenin en güncel aşı oranı kullanılır. Veri yoksa hafta boş bırakılır; sıfır aşılama yapılmış gibi gösterilmez.

Türkiye'de en az bir doz ve tam aşılama oranı 2021 boyunca yükselmiş, daha sonra yataylaşmıştır. Vaka ve ölüm eğrileriyle aynı zaman ekseninde gösterim, dönemlerin birlikte nasıl değiştiğini açıklar. Bu görsel nedensel bir aşı etkisi kanıtı değildir; varyantlar, test düzeyi, yaş yapısı ve raporlama gibi etkenler ayrıca rol oynar.
