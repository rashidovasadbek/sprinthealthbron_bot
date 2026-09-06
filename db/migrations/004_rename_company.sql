-- ============================================================
--  Kompaniya rebrending: MEDIWELL → SPRINT HEALTH
-- ============================================================
-- 002_seed.sql allaqachon qo'llangan bazalarda kompaniya yozuvi hali
-- eski nom va eski h/r bilan turibdi. Bu migration o'sha yozuvni yangilaydi.
-- Yangi o'rnatishlarda 002 darhol yangi qiymatlarni yozadi va bu UPDATE
-- xuddi o'sha qiymatlarni qayta yozadi — ikkala holatda ham natija bir xil.
--
-- Faqat code, name va account_no tegiladi. Qolgan rekvizitlar
-- (bank, INN, MFO, direktor, address) o'zgarishsiz qoladi.
--
-- ⚠️ .env dagi COMPANY_CODE ham 'sprinthealth' ga o'zgartirilishi shart,
--    aks holda bot company jadvalidan yozuvni topa olmaydi.

UPDATE company
   SET code       = 'sprinthealth',
       name       = 'OOO "SPRINT HEALTH" MCHJ',
       account_no = '20208000807367249002'
 WHERE code IN ('mediwell', 'sprinthealth');
