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

-- Gunluk verinin ulke sayisini ve tarih kapsamini kontrol ediyoruz.
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
