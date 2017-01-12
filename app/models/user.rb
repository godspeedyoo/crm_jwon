class User < ApplicationRecord
  has_many :tasks

  acts_as_authentic do |c|
  end # the configuration block is optional
end
