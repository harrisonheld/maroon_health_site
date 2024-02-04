# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('medications/index', type: :view) do
  before do
    assign(:medications, [
      Medication.create!(
        name: 'Name',
        stock: 2,
        notes: 'MyText'
      ),
      Medication.create!(
        name: 'Name',
        stock: 2,
        notes: 'MyText'
      )
    ]
    )
  end

  it 'renders a list of medications' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
