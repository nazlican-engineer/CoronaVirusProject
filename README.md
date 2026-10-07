# COVID-19 Analysis Dashboard

SQL, Python ve Power BI kullanılarak hazırlanmış; ülkeler arasındaki COVID-19 vaka, ölüm, hastane, test, aşılama ve demografik göstergeleri inceleyen uçtan uca veri analizi projesi.

## Dashboard

Power BI raporu altı analiz sayfasından oluşur:

| Sayfa | Soru |
| --- | --- |
| Vaka Analizi | Vakalar zaman içinde ve ülkeler arasında nasıl değişti? |
| Ölüm Analizi | Ölümler, ölüm oranı ve nüfusa göre ölüm yükü nasıl değişti? |
| Yayılım ve Hastane | R değeri ile hastane/YBÜ göstergeleri nasıl seyretti? |
| Test Analizi | Test yoğunluğu ve pozitiflik oranı nasıl değişti? |
| Aşı Analizi | Aşılanma, vaka ve ölüm eğrileriyle birlikte nasıl ilerledi? |
| Demografik ve Ekonomik Analiz | Sağlık yükü, demografik ve ekonomik göstergelerle nasıl ilişkilendi? |

> Ekran görüntüleri eklendiğinde burada `dashboard/screenshots/` altından gösterilecektir.

## Teknolojiler

- **Python:** veri inceleme, temizlik ve analiz notebook'ları
- **PostgreSQL / SQL:** şema, tablo tanımları ve analiz sorguları
- **Power BI:** etkileşimli rapor, DAX ölçüleri ve filtreler

## Veri Kaynağı

Veri, [Our World in Data COVID-19 veri sayfasından](https://ourworldindata.org/coronavirus) alınır. Our World in Data tarafından üretilen veri ve görselleştirmeler, atıf koşuluyla CC BY lisansındadır; üçüncü taraf kaynaklı alanların kendi lisansları ayrıca kontrol edilmelidir.

## Proje Akışı

```text
Ham veri → veri denetimi ve temizleme → haftalık / analiz tabloları
        → PostgreSQL sorguları → Power BI dashboard
```

## Klasör Yapısı

```text
covid-analysis/
├── README.md
├── LICENSE
├── .gitignore
├── pyproject.toml
├── src/              # data_loader.py
├── notebooks/        # denetim, temizlik ve analiz notebook'ları
├── sql/              # şema ve analiz sorguları
├── dashboard/        # .pbix, tema ve ekran görüntüleri
├── docs/             # ölçüler, doğrulamalar ve metodoloji notları
├── data/             # yalnızca README.md ve .gitkeep sürüm kontrolünde
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

- Tayvan, Kosova, Hong Kong ve Filistin analizde ayrı ülke birimleri olarak ele alınır.
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

## Planlanan

Tahmin sayfası henüz eklenmemiştir. Gelecek çalışmada zaman serisi tahminleri ve model değerlendirmesi eklenebilir.

## Lisans

Kod ve proje dokümantasyonu [MIT License](LICENSE) ile sunulur. Veri kullanımında kaynak lisansları ayrıca geçerlidir.
