# frozen_string_literal: true
# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer          not null
#  content    :text
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  has_many :answers # :dependent => :destroy # [ryoma:bugFix]削除されたらそれに紐付くanswerも削除する
  belongs_to :user
end
