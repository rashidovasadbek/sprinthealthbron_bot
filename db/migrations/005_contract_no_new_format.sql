-- ============================================================
--  Shartnoma raqami formati: A/C  ->  N{A}/{B}/{C}
-- ============================================================
-- Masalan N01/90/02:
--   N01 — tartib raqami (counter jadvalidan). Kamida ikki xonagacha
--         nol bilan to'ldiriladi (1 -> 01); 99 dan oshsa tabiiy
--         o'sadi (100 -> N100).
--   90  — viloyat kodi (region.code). 003 da olib tashlangan edi, qaytdi.
--   02  — kompaniyaning sho't kodi (company.account_code).
--
-- Sxema o'zgarmaydi — contract.region_code ustuni 001 dan beri bor va
-- 003 dan keyin ham to'ldirilib kelgan. O'zgargani faqat contract_no
-- ni yig'ish mantiqi (db/repo.py).
--
-- Eski yozuvlar yangi formatga o'tkazilmaydi — butunlay o'chiriladi
-- va raqamlash N01 dan qayta boshlanadi.
--
-- ⚠️ Tartib muhim: bron.contract_id va bron.pharmacy_id da
--    ON DELETE CASCADE yo'q, shuning uchun avval bron, keyin
--    contract, keyin pharmacy o'chiriladi.
--
-- Yangi o'rnatishda bu jadvallar bo'sh — DELETE hech narsa qilmaydi.

DELETE FROM bron;
DELETE FROM contract;
DELETE FROM pharmacy;

UPDATE counter SET last_seq = 0;
