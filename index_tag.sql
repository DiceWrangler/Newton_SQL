--
--	index_tag.sql
--

-- Constraint: uk_tag_tag

ALTER TABLE tag DROP CONSTRAINT IF EXISTS uk_tag_tag;

ALTER TABLE tag ADD CONSTRAINT uk_tag_tag UNIQUE(tag);
