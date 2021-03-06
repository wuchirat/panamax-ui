require 'spec_helper'

describe ImagePresenter do

  let(:fake_image) do
    double(:fake_image,
      registry_id: 7,
      source: 'boom/shaka',
      tags: ['foo', 'bar'],
      description: 'goes boom shaka laka',
      short_description: 'goes boom',
      status_label: 'Local',
      badge_class: 'local',
      star_count: 123,
      docker_index_url: "#{DOCKER_INDEX_BASE_URL}boom/shaka",
      imagelayers_url: "#{IMAGELAYERS_URL}?images=boom/shaka"
    )
  end

  let(:view_context) { ActionView::Base.new }

  subject { ImagePresenter.new(fake_image, view_context) }

  describe '#title' do
    it 'exposes the image repository' do
      expect(subject.title).to eq 'boom/shaka'
    end
  end

  describe '#registry_id' do
    it 'exposes the image registry_id' do
      expect(subject.registry_id).to eq 7
    end
  end

  describe '#description' do
    it 'exposes the image description' do
      expect(subject.description).to eq 'goes boom shaka laka'
    end
  end

  describe '#status_label' do
    it 'exposes the image status label' do
      expect(subject.status_label).to eq 'Local'
    end
  end

  describe '#badge_class' do
    it 'exposes the image badge_class' do
      expect(subject.badge_class).to eq 'local'
    end
  end

  describe '#star_count' do
    it 'exposes the star count' do
      expect(subject.star_count).to eq 123
    end
  end

  describe '#docker_index_url' do
    it 'exposes the docker index url' do
      expect(subject.docker_index_url).to eq "#{DOCKER_INDEX_BASE_URL}boom/shaka"
    end
  end

  describe '#imagelayers_url' do
    it 'exposes the imagelayers url' do
      expect(subject.imagelayers_url).to eq "#{IMAGELAYERS_URL}?images=boom/shaka"
    end
  end

  describe '#tag_options' do
    it 'returns a set of HTML options for each tag' do
      expected =
        "<option value=\"foo\">foo</option>\n<option value=\"bar\">bar</option>"
      expect(subject.tag_options).to eq expected
    end
  end
end
