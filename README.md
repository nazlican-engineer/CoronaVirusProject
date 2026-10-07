# COVID-19 Analysis Dashboard

> Python, PostgreSQL ve Power BI ile ülkelerin COVID-19 vaka, ölüm, hastane, test, aşılama ve demografik göstergelerini inceleyen ülke düzeyinde veri analizi projesi.

![Vaka Analizi dashboard](dashboard/screenshots/01-vaka-analizi.png)

---

## Projenin Amacı

COVID-19 verileri ülkeler arasında farklı sıklıkta, farklı kapsamda ve bazen eksik bildirilir. Proje, ülke karşılaştırmalarını yalnızca toplam sayılara dayandırmak yerine veri kalitesini ve ölçü tanımını dikkate alarak daha anlamlı hâle getirmek için hazırlanmıştır.

Vaka, ölüm, test, aşılama, hastane ve demografik göstergeler aynı analiz akışında incelenir. Toplam sayılar ile nüfusa göre değerler birlikte sunulur; sonuçların hangi veri sınırları içinde yorumlanması gerektiği görünür kılınır.

---

## Öne Çıkan Bulgular

| Konu | Kısa bulgu | Ayrıntı |
|---|---|---|
| Vaka | Toplam vakada ABD, Çin ve Hindistan öne çıkar; nüfusa göre hesaplama sıralamayı değiştirir. | [Vaka analizi](notebooks/cases_analysis.ipynb) |
| Ölüm | Büyük nüfuslu ülkeler toplam ölümde öne çıkar; milyon kişi başına ölçü farklı ülkeleri öne taşır. | [Ölüm analizi](notebooks/deaths_analysis.ipynb) |
| Yayılım | R > 1 yayılımın artma eğiliminde olduğunu gösterir. R serisi kaynakta 02.01.2023'te biter. | [Yayılım ve hastane](notebooks/spread_hospital_analysis.ipynb) |
| Test | Farklı test birimleri aynı ölçü değildir. Ülkeler arası sıralamada yalnızca yapılan test sayısı kullanılır. | [Test analizi](notebooks/testing_analysis.ipynb) |
| Aşı | Eksik aşı kaydı sıfır kabul edilmez; Türkiye'de aşı oranları 2021 boyunca yükselip sonra yataylaşır. | [Aşı analizi](notebooks/vaccination_analysis.ipynb) |
| Demografi | Yaşlı nüfus oranı ile milyon kişi başına ölüm arasında pozitif ilişki görülür; bu nedensellik değildir. | [Demografik analiz](notebooks/demographic_economic_analysis.ipynb) |

### Notebook Rehberi

| Dosya | Amaç | Analizde öne çıkan nokta |
|---|---|---|
| [data_audit_cleaning.ipynb](notebooks/data_audit_cleaning.ipynb) | Ham veriyi denetler, konumları ayırır ve temiz ülke tablosunu üretir. | Tekrar eden ülke-tarih kayıtları çelişki yoksa dolu değerler korunarak tekilleştirilir. |
| [cases_analysis.ipynb](notebooks/cases_analysis.ipynb) | Vaka, haftalık değişim, eksik gün ve milyon kişi başına vaka analizi yapar. | Eksik gün sıfır sayılmaz; tam olmayan haftalar ülkeler arası karşılaştırmaya girmez. |
| [deaths_analysis.ipynb](notebooks/deaths_analysis.ipynb) | Ölüm serilerini ve nüfusa göre ölüm yükünü inceler. | Kümülatif ölümdeki kaynak düzeltmeleri korunur; eksik günler sıfırla doldurulmaz. |
| [spread_hospital_analysis.ipynb](notebooks/spread_hospital_analysis.ipynb) | R değeri, önlem sıkılığı, hastane ve yoğun bakım yükünü inceler. | Hastane/YBÜ verisi yalnızca kayıt paylaşan ülkeler için yorumlanır. |
| [testing_analysis.ipynb](notebooks/testing_analysis.ipynb) | Test kapsamı, test birimi ve pozitiflik oranını inceler. | Yapılan test, test edilen kişi ve örnek sayısı aynı ölçü değildir. |
| [vaccination_analysis.ipynb](notebooks/vaccination_analysis.ipynb) | Aşı dozları ve aşılanma oranlarını vaka/ölüm eğrileriyle inceler. | Aşı oranında her ülkenin son geçerli değeri kullanılır. |
| [demographic_economic_analysis.ipynb](notebooks/demographic_economic_analysis.ipynb) | Demografik ve ekonomik göstergeler ile COVID-19 yükü ilişkisini inceler. | Her nokta bir ülkeyi temsil eder; korelasyon neden-sonuç kanıtı değildir. |

### Ayrıntılı Analiz Notları

Notebook bulguları, görselleri ve hesaplama gerekçeleri konu bazında aşağıdaki notlara taşınmıştır. SQL yaklaşımı; Python ile üretilen temiz ve haftalık tabloların PostgreSQL içinde nasıl doğrulandığını açıklar.

- [Veri denetimi ve temizlik](docs/findings/01-data-cleaning.md)
- [Vaka ve ölüm analizi](docs/findings/02-cases-deaths.md)
- [Yayılım ve hastane analizi](docs/findings/03-spread-hospital.md)
- [Test analizi](docs/findings/04-testing.md)
- [Aşı analizi](docs/findings/05-vaccination.md)
- [Demografik ve ekonomik analiz](docs/findings/06-demographic.md)
- [SQL ile veri doğrulama ve analiz yaklaşımı](docs/sql-approach.md)

---

## Dashboard Görselleri

### Vaka Analizi

![Vaka Analizi](dashboard/screenshots/01-vaka-analizi.png)

Bu sayfa, seçilen dönemde vaka sayılarının nasıl değiştiğini gösterir.

- **Dönemlik Yeni Vaka:** Seçilen tarihlerde bildirilen yeni vakaların toplamı.
- **Kümülatif Vaka:** Her ülkenin ulaştığı son toplam vaka sayısı.
- **Milyon Kişi Başına Vaka:** Toplam vakanın ülke nüfusuna göre karşılaştırılmış hâli.
- **Eksik Gün:** Yeni vaka bilgisi olmayan gün sayısıdır; sıfır vaka anlamına gelmez.

Aylık çizgi grafik salgın dalgalarını, çubuk grafik ülkeleri nüfusa göre karşılaştırır, harita ise yükün ülkeler arasındaki dağılımını gösterir.

### Ölüm Analizi

![Ölüm Analizi](dashboard/screenshots/02-olum-analizi.png)

Bu sayfa, seçilen dönemdeki ölüm yükünü vaka sayılarıyla birlikte yorumlamaya yardım eder.

- **Dönemlik Yeni Ölüm:** Seçilen tarihlerdeki yeni ölüm toplamı.
- **Kümülatif Ölüm:** Her ülkenin son bildirilen toplam ölüm değeri.
- **Milyon Başına Ölüm:** Ölüm yükünün nüfusa göre karşılaştırılmış hâli.
- **Vaka Ölüm Oranı:** Kümülatif ölümün kümülatif vakaya oranı.

Çizgi grafik yıllara göre aylık ölümleri, sütun grafik kıtalardaki dağılımı, harita ise nüfusa göre ölüm yükünü gösterir.

### Yayılım ve Hastane

![Yayılım ve Hastane](dashboard/screenshots/03-yayilim-hastane.png)

Bu sayfa, salgının yayılma hızını ve sağlık sistemi üzerindeki yükü birlikte gösterir.

- **R Değeri:** Bir hastanın ortalama kaç kişiye hastalığı bulaştırdığını gösterir. R 1'in üzerindeyse yayılım artma eğilimindedir.
- **Hastane / YBÜ Verisi Veren Ülke:** Bu alanlarda en az bir kayıt paylaşan ülke sayısıdır.
- **R Verisinin Kaynakta Bittiği Tarih:** R değerinin son bulunduğu gündür.

Hastane/YBÜ seçim kutusundan gösterilecek hasta türü seçilir. Grafik, veri paylaşan ülkelerin milyon kişi başına günlük ortalamasını verir.

### Test Analizi

![Test Analizi](dashboard/screenshots/04-test-analizi.png)

Bu sayfa, test yoğunluğu ve pozitiflik oranını inceler.

- **Test Verisi Veren Ülke:** En az bir toplam test kaydı bulunan ülke sayısı.
- **Ortalama Pozitiflik Oranı:** Veri paylaşan ülkelerdeki pozitiflik oranlarının ortalaması.
- **Test Son Gözlem Tarihi:** Test verisinin kaynakta son bulunduğu tarih.

Çubuk grafik bin kişi başına kümülatif testte ilk 10 ülkeyi gösterir. Test karşılaştırmasına yalnızca aynı birimde, yani yapılan test sayısı olarak veri bildiren ülkeler girer.

### Aşı Analizi

![Aşı Analizi](dashboard/screenshots/05-asi-analizi.png)

Bu sayfa, aşılanmanın zaman içindeki ilerleyişini yeni vaka ve ölüm eğrileriyle birlikte gösterir.

- **En Az Bir Doz Oranı:** Nüfusa göre en az bir doz aşı olanların oranı.
- **Tam Aşılı Oranı:** Nüfusa göre tam aşılı kişilerin oranı.
- **Aşı Verisi Veren Ülke:** En az bir aşı kaydı paylaşan ülke sayısı.
- **Yeni Vaka / Yeni Ölüm:** Seçilen tarihlerdeki toplam yeni vaka ve ölüm sayıları.

Aşı oranında her ülkenin o tarihe kadarki son bilinen değeri kullanılır. Böylece o gün veri paylaşmayan ülkeler yüzünden oran yapay olarak düşmez.

### Demografik ve Ekonomik Analiz

![Demografik ve Ekonomik Analiz](dashboard/screenshots/06-demografik-ekonomik.png)

Bu sayfa, ülkelerin demografik ve ekonomik göstergeleri ile milyon kişi başına ölüm yükü arasındaki ilişkiyi gösterir.

- **Ortalama Yaşam Beklentisi, Kişi Başı GSYH ve Medyan Yaş:** Seçilen ülkelerin ortalama değerleri.
- Her nokta bir ülkeyi, renkler ise kıtaları temsil eder.
- Grafiklerde GSYH, medyan yaş ve insani gelişmişlik endeksi ile ölüm yükü birlikte incelenir.

Bu noktaların yakın veya uzak olması ilişkiyi anlatır; tek başına bir göstergenin ölümlere neden olduğunu kanıtlamaz.

---

## Proje Akışı

```text
Ham veri → veri denetimi ve temizleme → haftalık / analiz tabloları
        → PostgreSQL sorguları → Power BI dashboard
```

## Teknolojiler

- **Python:** veri inceleme, temizlik ve analiz notebook'ları
- **PostgreSQL / SQL:** şema, tablo tanımları ve analiz sorguları
- **Power BI:** etkileşimli rapor, DAX ölçüleri ve filtreler

## Klasör Yapısı

```text
covid-analysis/
├── README.md
├── .gitignore
├── pyproject.toml
├── src/              # data_loader.py
├── notebooks/        # denetim, temizlik ve analiz notebook'ları
├── sql/              # şema ve analiz sorguları
├── dashboard/        # .pbix, tema ve ekran görüntüleri
├── docs/             # ölçüler, doğrulamalar ve metodoloji notları
├── data/             # yalnızca README.md sürüm kontrolünde
└── outputs/          # yerel üretilen tablolar ve görseller
```

## Kurulum ve Çalıştırma

1. Depoyu klonlayın ve Python ortamını oluşturun.
2. Bağımlılıkları `pyproject.toml` üzerinden kurun.
3. Kaynak veriyi `data/raw/` altına yerel olarak indirin.
4. Önce `notebooks/data_audit_cleaning.ipynb` notebook'unu çalıştırın.
5. Diğer notebook'ları analiz sırasına göre çalıştırın.
6. Power BI içinde `dashboard/covid19_dashboard.pbix` dosyasını açın; veri kaynağı yolunu kendi yerel `data/processed/` klasörünüze göre güncelleyin.

Ayrıntılı veri yerleşimi için [data/README.md](data/README.md) dosyasına bakın.

## Önemli Hesaplama Kararları

- Tayvan, Kosova, Hong Kong ve Filistin analizde ayrı ülke birimleri olarak ele alınır. Veri kaynağının ülke olarak listelediği konumlar analizde ülke birimi kabul edilir.
- Eksik gözlemler sıfır kabul edilmez; kartlarda ve grafiklerde boş kalır.
- Haftalık analizlerde tam hafta kuralı uygulanır.
- Kümülatif değerler, ülkeler için son geçerli değerin alınmasıyla hesaplanır; günlük satırlar toplanmaz.
- Oranlar ve kişi başına değerler ülkeler arasında doğrudan toplanmaz; ölçüye uygun ağırlıklı ya da ülke ortalaması yaklaşımı kullanılır.
- Demografik grafikler ülke düzeyindedir; ilişkiler nedensellik kanıtı değildir.

## Sınırlamalar

- R değeri kaynağı 02.01.2023 tarihinde sona erer.
- Hastane ve YBÜ göstergeleri yalnızca veri paylaşan birkaç düzine ülkeyi kapsar.
- Test ve aşı serilerinde bildirim farkları, eksik günler ve geriye dönük düzeltmeler bulunabilir.
- Ülkeler arası karşılaştırmalarda veri kalitesi ile raporlama kapsamı sonuçları etkileyebilir.

## Veri Kaynağı

Veri, [Our World in Data COVID-19 veri sayfasından](https://ourworldindata.org/coronavirus) alınır. Our World in Data tarafından üretilen veri ve görselleştirmeler, atıf koşuluyla CC BY lisansındadır; üçüncü taraf kaynaklı alanların kendi lisansları ayrıca kontrol edilmelidir.

## Lisans

Bu proje [MIT License](LICENSE) ile lisanslanmıştır.
