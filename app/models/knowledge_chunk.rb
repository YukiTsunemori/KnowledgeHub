class KnowledgeChunk < ApplicationRecord
  has_neighbors :embedding
end
