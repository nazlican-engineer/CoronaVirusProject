-- COVID projesine ait tabloları ayrı bir şema altında tutuyoruz.
CREATE SCHEMA IF NOT EXISTS covid;


-- Aktarılan günlük ülke verisinin kayıt sayısını kontrol ediyoruz.
SELECT COUNT(*) AS kayit_sayisi
FROM covid.countries_clean;

-- Aktarılan haftalık vaka kaydı sayısını kontrol ediyoruz.
SELECT COUNT(*) AS kayit_sayisi
FROM covid.weekly_cases;

-- Aktarılan haftalık ölüm kaydı sayısını kontrol ediyoruz.
SELECT COUNT(*) AS kayit_sayisi
FROM covid.weekly_deaths;

-- Aktarılan haftalık test kaydı sayısını kontrol ediyoruz.
SELECT COUNT(*) AS kayit_sayisi
FROM covid.weekly_tests;


-- Aktarilan dort tablonun kayit sayilarini birlikte kontrol ediyoruz.
SELECT 'countries_clean' AS tablo, COUNT(*) AS kayit_sayisi
FROM covid.countries_clean
UNION ALL
SELECT 'weekly_cases', COUNT(*)
FROM covid.weekly_cases
UNION ALL
SELECT 'weekly_deaths', COUNT(*)
FROM covid.weekly_deaths
UNION ALL
SELECT 'weekly_tests', COUNT(*)
FROM covid.weekly_tests
ORDER BY tablo;

-- Gunluk ulke verisinde ayni ulke ve tarih icin tekrar eden kayit olup olmadigini kontrol ediyoruz.
SELECT COUNT(*) AS tekrar_eden_ulke_tarih_grubu
FROM (
    SELECT location, date
    FROM covid.countries_clean
    GROUP BY location, date
    HAVING COUNT(*) > 1
) AS tekrarlar;

-- Gunluk verinin ulke sayisini ve tarih kapsamını kontrol ediyoruz.
SELECT
    COUNT(DISTINCT location) AS ulke_sayisi,
    MIN(date) AS ilk_tarih,
    MAX(date) AS son_tarih
FROM covid.countries_clean;

-- Haftalik vaka tablosunun kapsamini kontrol ediyoruz.
SELECT
    COUNT(DISTINCT location) AS ulke_sayisi,
    MIN(hafta_baslangici) AS ilk_hafta,
    MAX(hafta_baslangici) AS son_hafta,
    COUNT(*) AS kayit_sayisi
FROM covid.weekly_cases;

-- Haftalik olum tablosunun kapsamini kontrol ediyoruz.
SELECT
    COUNT(DISTINCT location) AS ulke_sayisi,
    MIN(hafta_baslangici) AS ilk_hafta,
    MAX(hafta_baslangici) AS son_hafta,
    COUNT(*) AS kayit_sayisi
FROM covid.weekly_deaths;

-- Haftalik test tablosunun kapsamini kontrol ediyoruz.
SELECT
    COUNT(DISTINCT location) AS ulke_sayisi,
    MIN(hafta_baslangici) AS ilk_hafta,
    MAX(hafta_baslangici) AS son_hafta,
    COUNT(*) AS kayit_sayisi
FROM covid.weekly_tests;


-- Haftalik aşı tablosunun kapsamini kontrol ediyoruz
SELECT
    COUNT(*) AS kayit_sayisi,
    COUNT(DISTINCT location) AS ulke_sayisi,
    MIN(hafta_baslangici) AS ilk_hafta,
    MAX(hafta_baslangici) AS son_hafta
FROM covid.weekly_vaccinations;


-- Günlük temiz ülke verisinden ilk 100 kaydı inceliyoruz.
SELECT *
FROM covid.countries_clean
LIMIT 100;

SELECT *
FROM covid.weekly_cases
LIMIT 100;

SELECT *
FROM covid.weekly_deaths
LIMIT 100;

SELECT *
FROM covid.weekly_tests
LIMIT 100;

SELECT *
FROM covid.weekly_vaccinations 
LIMIT 100;


-- Analizlerde kullanacağımız temel değişkenlerin
-- kayıt ve ülke bazındaki veri kapsamını ölçüyoruz.
SELECT
    'total_cases' AS degisken,
    COUNT(total_cases) AS dolu_kayit,
    COUNT(*) - COUNT(total_cases) AS eksik_kayit,
    ROUND(100.0 * COUNT(total_cases) / COUNT(*), 2) AS veri_kapsami_yuzde,
    COUNT(DISTINCT location) FILTER (
        WHERE total_cases IS NOT null--total_cases değeri boş olmayanları alıyoruz
    ) AS veri_bulunan_ulke_sayisi
FROM covid.countries_clean

UNION ALL

SELECT
    'new_cases',
    COUNT(new_cases),
    COUNT(*) - COUNT(new_cases),
    ROUND(100.0 * COUNT(new_cases) / COUNT(*), 2),
    COUNT(DISTINCT location) FILTER (
        WHERE new_cases IS NOT NULL
    )
FROM covid.countries_clean

UNION ALL

SELECT
    'total_deaths',
    COUNT(total_deaths),
    COUNT(*) - COUNT(total_deaths),
    ROUND(100.0 * COUNT(total_deaths) / COUNT(*), 2),
    COUNT(DISTINCT location) FILTER (
        WHERE total_deaths IS NOT NULL
    )
FROM covid.countries_clean

UNION ALL

SELECT
    'total_tests',
    COUNT(total_tests),
    COUNT(*) - COUNT(total_tests),
    ROUND(100.0 * COUNT(total_tests) / COUNT(*), 2),
    COUNT(DISTINCT location) FILTER (
        WHERE total_tests IS NOT NULL
    )
FROM covid.countries_clean

UNION ALL

SELECT
    'people_fully_vaccinated_per_hundred',
    COUNT(people_fully_vaccinated_per_hundred),
    COUNT(*) - COUNT(people_fully_vaccinated_per_hundred),
    ROUND(
        100.0 * COUNT(people_fully_vaccinated_per_hundred) / COUNT(*),
        2
    ),
    COUNT(DISTINCT location) FILTER (
        WHERE people_fully_vaccinated_per_hundred IS NOT NULL
    )
FROM covid.countries_clean

UNION ALL

SELECT
    'reproduction_rate',
    COUNT(reproduction_rate),
    COUNT(*) - COUNT(reproduction_rate),
    ROUND(100.0 * COUNT(reproduction_rate) / COUNT(*), 2),
    COUNT(DISTINCT location) FILTER (
        WHERE reproduction_rate IS NOT NULL
    )
FROM covid.countries_clean

UNION ALL

SELECT
    'icu_patients',
    COUNT(icu_patients),
    COUNT(*) - COUNT(icu_patients),
    ROUND(100.0 * COUNT(icu_patients) / COUNT(*), 2),
    COUNT(DISTINCT location) FILTER (
        WHERE icu_patients IS NOT NULL
    )
FROM covid.countries_clean

UNION ALL

SELECT
    'hosp_patients',
    COUNT(hosp_patients),
    COUNT(*) - COUNT(hosp_patients),
    ROUND(100.0 * COUNT(hosp_patients) / COUNT(*), 2),
    COUNT(DISTINCT location) FILTER (
        WHERE hosp_patients IS NOT NULL
    )
FROM covid.countries_clean

ORDER BY veri_kapsami_yuzde;


-- Haftalık tablolardaki veri durumu etiketlerini
-- hangi tablonun ne kadar eksik veya tam veri taşıdığını görmek için sayıyoruz.
SELECT
    'weekly_cases' AS tablo,
    veri_durumu,
    COUNT(*) AS kayit_sayisi
FROM covid.weekly_cases
GROUP BY veri_durumu

UNION ALL

SELECT
    'weekly_deaths',
    veri_durumu,
    COUNT(*)
FROM covid.weekly_deaths
GROUP BY veri_durumu

UNION ALL

SELECT
    'weekly_tests',
    veri_durumu,
    COUNT(*)
FROM covid.weekly_tests
GROUP BY veri_durumu

UNION ALL

SELECT
    'weekly_vaccinations',
    veri_durumu,
    COUNT(*)
FROM covid.weekly_vaccinations
GROUP BY veri_durumu

ORDER BY tablo, veri_durumu;


-- Dünya genelinde en yüksek yeni vaka görülen 10 haftayı buluyoruz.
SELECT
    hafta_baslangici,
    hafta_sonu,
    SUM(haftalik_yeni_vaka) AS toplam_haftalik_yeni_vaka
FROM covid.weekly_cases
WHERE tam_hafta = TRUE
  AND haftalik_yeni_vaka IS NOT NULL
GROUP BY
    hafta_baslangici,
    hafta_sonu
ORDER BY toplam_haftalik_yeni_vaka DESC
LIMIT 10;

-- En yüksek toplam yeni vaka görülen haftada
-- en fazla vaka bildiren ülkeleri ve dünya toplamındaki paylarını buluyoruz.
WITH en_yuksek_vaka_haftasi AS (
    SELECT
        hafta_baslangici,
        SUM(haftalik_yeni_vaka) AS toplam_haftalik_yeni_vaka
    FROM covid.weekly_cases
    WHERE tam_hafta = TRUE
      AND haftalik_yeni_vaka IS NOT NULL
    GROUP BY hafta_baslangici
    ORDER BY toplam_haftalik_yeni_vaka DESC
    LIMIT 1
)

SELECT
    wc.location,
    wc.hafta_baslangici,
    wc.haftalik_yeni_vaka,
ROUND(
    (
        100.0 * wc.haftalik_yeni_vaka
        / evh.toplam_haftalik_yeni_vaka
    )::NUMERIC,
    2
) AS dunya_toplamindaki_payi_yuzde
FROM covid.weekly_cases AS wc
JOIN en_yuksek_vaka_haftasi AS evh
    ON wc.hafta_baslangici = evh.hafta_baslangici
WHERE wc.tam_hafta = TRUE
  AND wc.haftalik_yeni_vaka IS NOT NULL
ORDER BY wc.haftalik_yeni_vaka DESC
LIMIT 15;


-- Çin'in sıra dışı yüksek vaka haftasının öncesi ve sonrasındaki
-- haftalık vaka değerlerini inceliyoruz.
SELECT
    hafta_baslangici,
    hafta_sonu,
    haftalik_yeni_vaka,
    hafta_sonu_toplam_vaka,
    veri_durumu
FROM covid.weekly_cases
WHERE location = 'China'
  AND hafta_baslangici BETWEEN DATE '2022-11-21' AND DATE '2023-01-23'
ORDER BY hafta_baslangici;

-- Çin'in çok büyük Aralık 2022 dalgasını ayrı tutarak
-- diğer ülkelerde en yüksek vaka görülen haftaları buluyoruz.
SELECT
    hafta_baslangici,
    hafta_sonu,
    SUM(haftalik_yeni_vaka) AS cin_haric_toplam_haftalik_yeni_vaka
FROM covid.weekly_cases
WHERE tam_hafta = TRUE
  AND haftalik_yeni_vaka IS NOT NULL
  AND location <> 'China' --Çin hariç
GROUP BY
    hafta_baslangici,
    hafta_sonu
ORDER BY cin_haric_toplam_haftalik_yeni_vaka DESC
LIMIT 10;

-- Çin hariç en yüksek vaka haftasında,
-- en çok vaka bildiren ülkeleri buluyoruz.
WITH cin_haric_en_yuksek_hafta AS (
    SELECT
        hafta_baslangici,
        SUM(haftalik_yeni_vaka) AS toplam_vaka
    FROM covid.weekly_cases
    WHERE tam_hafta = TRUE
      AND haftalik_yeni_vaka IS NOT NULL
      AND location <> 'China'
    GROUP BY hafta_baslangici
    ORDER BY toplam_vaka DESC
    LIMIT 1
)

SELECT
    wc.location,
    wc.haftalik_yeni_vaka,
    ROUND(
        (
            100.0 * wc.haftalik_yeni_vaka / ch.toplam_vaka
        )::NUMERIC,
        2
    ) AS cin_haric_toplamdaki_payi_yuzde
FROM covid.weekly_cases AS wc
JOIN cin_haric_en_yuksek_hafta AS ch
    ON wc.hafta_baslangici = ch.hafta_baslangici
WHERE wc.tam_hafta = TRUE
  AND wc.haftalik_yeni_vaka IS NOT NULL
  AND wc.location <> 'China'
ORDER BY wc.haftalik_yeni_vaka DESC
LIMIT 15;


-- Çin hariç en yüksek vaka haftasında ülkeleri
-- nüfus etkisini kaldırarak milyon kişi başına vaka ile karşılaştırıyoruz.
WITH cin_haric_en_yuksek_hafta AS (
    SELECT
        hafta_baslangici,
        SUM(haftalik_yeni_vaka) AS toplam_vaka
    FROM covid.weekly_cases
    WHERE tam_hafta = TRUE
      AND haftalik_yeni_vaka IS NOT NULL
      AND location <> 'China'
    GROUP BY hafta_baslangici
    ORDER BY toplam_vaka DESC
    LIMIT 1
)

SELECT
    wc.location,
    wc.population,
    wc.haftalik_yeni_vaka,
    ROUND(
        wc.haftalik_vaka_milyon_basina::NUMERIC,
        2
    ) AS haftalik_vaka_milyon_basina
FROM covid.weekly_cases AS wc
JOIN cin_haric_en_yuksek_hafta AS ch
    ON wc.hafta_baslangici = ch.hafta_baslangici
WHERE wc.tam_hafta = TRUE
  AND wc.haftalik_vaka_milyon_basina IS NOT NULL
  AND wc.location <> 'China'
ORDER BY wc.haftalik_vaka_milyon_basina DESC
LIMIT 15;

-- Her ülkenin pandemi boyunca milyon kişi başına en yüksek
-- haftalık vaka gördüğü haftayı buluyoruz.
WITH ulke_vaka_zirveleri AS (
    SELECT
        location,
        population,
        hafta_baslangici,
        hafta_sonu,
        haftalik_yeni_vaka,
        haftalik_vaka_milyon_basina,
        ROW_NUMBER() OVER (
            PARTITION BY location
            ORDER BY haftalik_vaka_milyon_basina DESC
        ) AS sira
    FROM covid.weekly_cases
    WHERE tam_hafta = TRUE
      AND haftalik_vaka_milyon_basina IS NOT NULL
      AND population >= 1000000
)

SELECT
    location,
    population,
    hafta_baslangici,
    hafta_sonu,
    haftalik_yeni_vaka,
    ROUND(
        haftalik_vaka_milyon_basina::NUMERIC,
        2
    ) AS haftalik_vaka_milyon_basina
FROM ulke_vaka_zirveleri
WHERE sira = 1
ORDER BY haftalik_vaka_milyon_basina DESC
LIMIT 15;


-- Bir önceki haftaya göre vaka artışı en yüksek olan
-- ülke-hafta kayıtlarını buluyoruz.
-- Çok küçük başlangıç değerlerinden oluşan yanıltıcı yüzdeleri azaltmak için
-- önceki haftada en az 10.000 vaka olmasını istiyoruz.
SELECT
    location,
    hafta_baslangici,
    onceki_hafta_vaka,
    haftalik_yeni_vaka,
    haftalik_degisim,
    ROUND(
        haftalik_degisim_yuzde::NUMERIC,
        2
    ) AS haftalik_degisim_yuzde
FROM covid.weekly_cases
WHERE tam_hafta = TRUE
  AND onceki_hafta_tam = TRUE
  AND onceki_hafta_vaka >= 10000
  AND haftalik_degisim > 0
  AND haftalik_degisim_yuzde IS NOT NULL
ORDER BY haftalik_degisim_yuzde DESC
LIMIT 15;

-- Tam hafta verisi bulunan ülkeleri kullanarak
-- dünya genelinde en yüksek yeni ölüm görülen 10 haftayı buluyoruz.
SELECT
    hafta_baslangici,
    hafta_sonu,
    SUM(haftalik_yeni_olum) AS toplam_haftalik_yeni_olum
FROM covid.weekly_deaths
WHERE tam_hafta = TRUE
  AND haftalik_yeni_olum IS NOT NULL
GROUP BY
    hafta_baslangici,
    hafta_sonu
ORDER BY toplam_haftalik_yeni_olum DESC
LIMIT 10;

-- Dünya genelinde en yüksek yeni ölüm görülen haftada
-- en fazla ölüm bildiren ülkeleri ve toplam içindeki paylarını buluyoruz.
WITH en_yuksek_olum_haftasi AS (
    SELECT
        hafta_baslangici,
        SUM(haftalik_yeni_olum) AS toplam_haftalik_yeni_olum
    FROM covid.weekly_deaths
    WHERE tam_hafta = TRUE
      AND haftalik_yeni_olum IS NOT NULL
    GROUP BY hafta_baslangici
    ORDER BY toplam_haftalik_yeni_olum DESC
    LIMIT 1
)

SELECT
    wd.location,
    wd.hafta_baslangici,
    wd.haftalik_yeni_olum,
    ROUND(
        (
            100.0 * wd.haftalik_yeni_olum
            / eoh.toplam_haftalik_yeni_olum
        )::NUMERIC,
        2
    ) AS dunya_toplamindaki_payi_yuzde
FROM covid.weekly_deaths AS wd
JOIN en_yuksek_olum_haftasi AS eoh
    ON wd.hafta_baslangici = eoh.hafta_baslangici
WHERE wd.tam_hafta = TRUE
  AND wd.haftalik_yeni_olum IS NOT NULL
ORDER BY wd.haftalik_yeni_olum DESC
LIMIT 15;

-- En yüksek küresel ölüm haftasında ülkeleri
-- milyon kişi başına yeni ölüm oranıyla karşılaştırıyoruz.
WITH en_yuksek_olum_haftasi AS (
    SELECT
        hafta_baslangici,
        SUM(haftalik_yeni_olum) AS toplam_haftalik_yeni_olum
    FROM covid.weekly_deaths
    WHERE tam_hafta = TRUE
      AND haftalik_yeni_olum IS NOT NULL
    GROUP BY hafta_baslangici
    ORDER BY toplam_haftalik_yeni_olum DESC
    LIMIT 1
)

SELECT
    wd.location,
    wd.population,
    wd.haftalik_yeni_olum,
    ROUND(
        wd.haftalik_olum_milyon_basina::NUMERIC,
        2
    ) AS haftalik_olum_milyon_basina
FROM covid.weekly_deaths AS wd
JOIN en_yuksek_olum_haftasi AS eoh
    ON wd.hafta_baslangici = eoh.hafta_baslangici
WHERE wd.tam_hafta = TRUE
  AND wd.haftalik_olum_milyon_basina IS NOT NULL
ORDER BY wd.haftalik_olum_milyon_basina DESC
LIMIT 15;

-- Her ülkenin pandemi boyunca milyon kişi başına en yüksek
-- haftalık ölüm gördüğü haftayı buluyoruz.
WITH ulke_olum_zirveleri AS (
    SELECT
        location,
        population,
        hafta_baslangici,
        hafta_sonu,
        haftalik_yeni_olum,
        haftalik_olum_milyon_basina,
        ROW_NUMBER() OVER (
            PARTITION BY location
            ORDER BY haftalik_olum_milyon_basina DESC
        ) AS sira
    FROM covid.weekly_deaths
    WHERE tam_hafta = TRUE
      AND haftalik_olum_milyon_basina IS NOT NULL
      AND population >= 1000000
)

SELECT
    location,
    population,
    hafta_baslangici,
    hafta_sonu,
    haftalik_yeni_olum,
    ROUND(
        haftalik_olum_milyon_basina::NUMERIC,
        2
    ) AS haftalik_olum_milyon_basina
FROM ulke_olum_zirveleri
WHERE sira = 1
ORDER BY haftalik_olum_milyon_basina DESC
LIMIT 15;

-- Şili ve Ekvador'daki sıra dışı yüksek ölüm haftalarının
-- tek haftalık mı yoksa devam eden bir dönem mi olduğunu inceliyoruz.
SELECT
    location,
    hafta_baslangici,
    hafta_sonu,
    haftalik_yeni_olum,
    hafta_sonu_toplam_olum,
    veri_durumu
FROM covid.weekly_deaths
WHERE (
        location = 'Chile'
        AND hafta_baslangici BETWEEN DATE '2022-02-21' AND DATE '2022-04-18'
      )
   OR (
        location = 'Ecuador'
        AND hafta_baslangici BETWEEN DATE '2021-06-21' AND DATE '2021-08-16'
      )
ORDER BY
    location,
    hafta_baslangici;

--ani artışların olduğu haftayı inceliyoruz
SELECT
    date,
    new_deaths,
    total_deaths
FROM covid.countries_clean
WHERE location = 'Chile'
  AND date BETWEEN DATE '2022-03-21' AND DATE '2022-03-27'
ORDER BY date;

SELECT
    date,
    new_deaths,
    total_deaths
FROM covid.countries_clean
WHERE location = 'Ecuador'
  AND date BETWEEN DATE '2021-07-19' AND DATE '2021-07-25'
ORDER BY date;


-- Tek haftalık toplu bildirimlerin etkisini azaltmak için
-- her ülkenin 4 haftalık hareketli ölüm ortalamasını hesaplıyoruz.
WITH dort_haftalik_ortalama AS (
    SELECT
        location,
        population,
        hafta_baslangici,
        hafta_sonu,
        AVG(haftalik_olum_milyon_basina) OVER (
            PARTITION BY location
            ORDER BY hafta_baslangici
            ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
        ) AS dort_haftalik_ortalama_olum_milyon_basina,
        COUNT(*) OVER (
            PARTITION BY location
            ORDER BY hafta_baslangici
            ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
        ) AS ortalama_icin_hafta_sayisi
    FROM covid.weekly_deaths
    WHERE tam_hafta = TRUE
      AND haftalik_olum_milyon_basina IS NOT NULL
),

ulke_surekli_olum_zirveleri AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY location
            ORDER BY dort_haftalik_ortalama_olum_milyon_basina DESC
        ) AS sira
    FROM dort_haftalik_ortalama
    WHERE ortalama_icin_hafta_sayisi = 4
      AND population >= 1000000
)

SELECT
    location,
    population,
    hafta_baslangici,
    hafta_sonu,
    ROUND(
        dort_haftalik_ortalama_olum_milyon_basina::NUMERIC,
        2
    ) AS dort_haftalik_ortalama_olum_milyon_basina
FROM ulke_surekli_olum_zirveleri
WHERE sira = 1
ORDER BY dort_haftalik_ortalama_olum_milyon_basina DESC
LIMIT 15;

-- Tam hafta test verisi bulunan kayıtlarda
-- kullanılan test ölçü birimlerini inceliyoruz.
SELECT
    COALESCE(test_birimi, 'Birim bilgisi yok') AS test_birimi,
    COUNT(*) AS tam_hafta_kayit_sayisi,
    COUNT(DISTINCT location) AS ulke_sayisi
FROM covid.weekly_tests
WHERE veri_durumu = 'Tam hafta'
GROUP BY COALESCE(test_birimi, 'Birim bilgisi yok')
ORDER BY tam_hafta_kayit_sayisi DESC;

-- Yapılan test sayısı olarak raporlayan ülkelerde
-- tam hafta test verisi kapsamını inceliyoruz.
SELECT
    location,
    COUNT(*) AS tam_hafta_sayisi,
    MIN(hafta_baslangici) AS ilk_hafta,
    MAX(hafta_baslangici) AS son_hafta
FROM covid.weekly_tests
WHERE veri_durumu = 'Tam hafta'
  AND test_birimi = 'tests performed'
GROUP BY location
ORDER BY tam_hafta_sayisi DESC
LIMIT 20;

-- Aynı hafta tam test ve tam vaka verisi bulunan ülkelerde
-- 100 test başına kayıtlı vaka oranını hesaplıyoruz.
SELECT
    wt.location,
    wt.hafta_baslangici,
    wt.haftalik_yeni_test AS haftalik_yeni_test,
    wc.haftalik_yeni_vaka,
    ROUND(
        (
            100.0 * wc.haftalik_yeni_vaka
            / wt.haftalik_yeni_test
        )::NUMERIC,
        2
    ) AS yuz_test_basina_vaka
FROM covid.weekly_tests AS wt
JOIN covid.weekly_cases AS wc
    ON wt.location = wc.location
   AND wt.hafta_baslangici = wc.hafta_baslangici
WHERE wt.veri_durumu = 'Tam hafta'
  AND wt.test_birimi = 'tests performed'
  AND wt.haftalik_yeni_test > 0
  AND wc.tam_hafta = TRUE
  AND wc.haftalik_yeni_vaka >= 0
ORDER BY yuz_test_basina_vaka DESC
LIMIT 20;

--Not:
--100 testte 123 vaka olamayacağı için test verisiyle vaka sayısının bu şekilde karşılaştıralamayacağını öğrenmiş olduk.

-- Kaynak veride bulunan positive_rate değerini kullanarak
-- haftalık ortalama test pozitiflik oranını hesaplıyoruz.
WITH haftalik_pozitiflik AS (
    SELECT
        location,
        DATE_TRUNC('week', date)::DATE AS hafta_baslangici,
        AVG(positive_rate) * 100 AS ortalama_pozitiflik_yuzde,
        COUNT(positive_rate) AS pozitiflik_kayitli_gun
    FROM covid.countries_clean
    WHERE positive_rate IS NOT NULL
    GROUP BY
        location,
        DATE_TRUNC('week', date)::DATE
)

SELECT
    location,
    hafta_baslangici,
    pozitiflik_kayitli_gun,
    ROUND(
        ortalama_pozitiflik_yuzde::NUMERIC,
        2
    ) AS ortalama_pozitiflik_yuzde
FROM haftalik_pozitiflik
WHERE pozitiflik_kayitli_gun >= 4
ORDER BY ortalama_pozitiflik_yuzde DESC
LIMIT 20;


-- Pozitiflik oranı ile günlük kişi başına test yoğunluğunu
-- aynı hafta içinde birlikte inceliyoruz.
WITH haftalik_test_gostergeleri AS (
    SELECT
        location,
        DATE_TRUNC('week', date)::DATE AS hafta_baslangici,
        AVG(positive_rate) * 100 AS ortalama_pozitiflik_yuzde,
        AVG(new_tests_smoothed_per_thousand) AS gunluk_test_bin_kisi,
        COUNT(positive_rate) AS pozitiflik_kayitli_gun,
        COUNT(new_tests_smoothed_per_thousand) AS test_kayitli_gun
    FROM covid.countries_clean
    WHERE positive_rate IS NOT NULL
       OR new_tests_smoothed_per_thousand IS NOT NULL
    GROUP BY
        location,
        DATE_TRUNC('week', date)::DATE
)

SELECT
    location,
    hafta_baslangici,
    ROUND(
        ortalama_pozitiflik_yuzde::NUMERIC,
        2
    ) AS ortalama_pozitiflik_yuzde,
    ROUND(
        gunluk_test_bin_kisi::NUMERIC,
        2
    ) AS gunluk_test_bin_kisi,
    pozitiflik_kayitli_gun,
    test_kayitli_gun
FROM haftalik_test_gostergeleri
WHERE pozitiflik_kayitli_gun >= 4
  AND test_kayitli_gun >= 4
ORDER BY ortalama_pozitiflik_yuzde DESC
LIMIT 20;

-- Her ülkenin en son geçerli aşı kaydını alarak
-- tam aşı oranı en yüksek ülkeleri buluyoruz.
WITH son_gecerli_asi_kaydi AS (
    SELECT
        location,
        hafta_baslangici,
        gozlem_tarihi,
        people_vaccinated_per_hundred,
        people_fully_vaccinated_per_hundred,
        ROW_NUMBER() OVER (
            PARTITION BY location
            ORDER BY gozlem_tarihi DESC
        ) AS sira
    FROM covid.weekly_vaccinations
    WHERE veri_durumu = 'Haftadaki son geçerli gözlem'
      AND people_fully_vaccinated_per_hundred IS NOT NULL
)

SELECT
    location,
    hafta_baslangici,
    gozlem_tarihi,
    ROUND(
        people_vaccinated_per_hundred::NUMERIC,
        2
    ) AS en_az_bir_doz_orani_yuzde,
    ROUND(
        people_fully_vaccinated_per_hundred::NUMERIC,
        2
    ) AS tam_asi_orani_yuzde
FROM son_gecerli_asi_kaydi
WHERE sira = 1
ORDER BY tam_asi_orani_yuzde DESC
LIMIT 20;

-- Aynı haftada geçerli tam aşı oranı bulunan ülke sayısını hesaplıyoruz.
-- Karşılaştırma için veri kapsamı en geniş haftayı seçmek istiyoruz.
SELECT
    hafta_baslangici,
    COUNT(DISTINCT location) AS veri_bulunan_ulke_sayisi
FROM covid.weekly_vaccinations
WHERE veri_durumu = 'Haftadaki son geçerli gözlem'
  AND people_fully_vaccinated_per_hundred IS NOT NULL
GROUP BY hafta_baslangici
ORDER BY
    veri_bulunan_ulke_sayisi DESC,
    hafta_baslangici DESC
LIMIT 20;

-- 6 Eylül 2021 haftasında geçerli verisi bulunan ülkeleri
-- tam aşı oranına göre sıralıyoruz.
SELECT
    location,
    hafta_baslangici,
    ROUND(
        people_vaccinated_per_hundred::NUMERIC,
        2
    ) AS en_az_bir_doz_orani_yuzde,
    ROUND(
        people_fully_vaccinated_per_hundred::NUMERIC,
        2
    ) AS tam_asi_orani_yuzde
FROM covid.weekly_vaccinations
WHERE hafta_baslangici = DATE '2021-09-06'
  AND veri_durumu = 'Haftadaki son geçerli gözlem'
  AND people_fully_vaccinated_per_hundred IS NOT NULL
ORDER BY tam_asi_orani_yuzde DESC
LIMIT 20;

-- 6 Eylül 2021 haftasındaki ülkeleri tam aşı oranına göre
-- yüksek, orta ve düşük kapsama gruplarına ayırıyoruz.
WITH asi_anlik_gorunumu AS (
    SELECT
        location,
        people_fully_vaccinated_per_hundred
    FROM covid.weekly_vaccinations
    WHERE hafta_baslangici = DATE '2021-09-06'
      AND veri_durumu = 'Haftadaki son geçerli gözlem'
      AND people_fully_vaccinated_per_hundred IS NOT NULL
)

SELECT
    CASE
        WHEN people_fully_vaccinated_per_hundred >= 70
            THEN 'Yuksek asi kapsami (%70 ve uzeri)'
        WHEN people_fully_vaccinated_per_hundred >= 40
            THEN 'Orta asi kapsami (%40 - %69,99)'
        ELSE 'Dusuk asi kapsami (%40 alti)'
    END AS asi_grubu,
    COUNT(*) AS ulke_sayisi,
    ROUND(
        AVG(people_fully_vaccinated_per_hundred)::NUMERIC,
        2
    ) AS ortalama_tam_asi_orani_yuzde
FROM asi_anlik_gorunumu
GROUP BY asi_grubu
ORDER BY ortalama_tam_asi_orani_yuzde DESC;













