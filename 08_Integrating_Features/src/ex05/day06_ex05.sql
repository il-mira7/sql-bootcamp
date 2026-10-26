COMMENT ON TABLE person_discounts IS 'Таблица со скидками для каждого человека';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ - id';
COMMENT ON COLUMN person_discounts.person_id IS 'Id человека';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Id пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки';
