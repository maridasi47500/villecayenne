class Note < ApplicationRecord
def self.mynotes
all.limit(5)
end
end