ALTER TABLE fabricetas.user ADD ESTADO varchar(1);
UPDATE fabricetas.user SET estado = 'A' WHERE estado is null;
