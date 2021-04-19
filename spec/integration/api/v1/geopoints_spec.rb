require 'swagger_helper'

describe 'API V1 Geopoints', swagger_doc: 'v1/swagger.json' do
  path '/geopoints' do
    get 'Retrieves Geopoints' do
      description 'Retrieves all the geopoints'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:geopoint, collection_count) }

      response '200', 'Geopoints retrieved' do
        schema('$ref' => '#/definitions/geopoints_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Geopoint' do
      description 'Creates Geopoint'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :geopoint, in: :body)

      response '201', 'geopoint created' do
        let(:geopoint) do
          {
            latitude: 6.66,
            longitude: 6.66,
            property_id: 666
          }
        end

        run_test!
      end
    end
  end

  path '/geopoints/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_geopoint) { create(:geopoint) }
    let(:id) { existent_geopoint.id }

    get 'Retrieves Geopoint' do
      produces 'application/json'

      response '200', 'geopoint retrieved' do
        schema('$ref' => '#/definitions/geopoint_resource')

        run_test!
      end

      response '404', 'invalid geopoint id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Geopoint' do
      description 'Updates Geopoint'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :geopoint, in: :body)

      response '200', 'geopoint updated' do
        let(:geopoint) do
          {
            latitude: 6.66,
            longitude: 6.66,
            property_id: 666
          }
        end

        run_test!
      end
    end

    delete 'Deletes Geopoint' do
      produces 'application/json'
      description 'Deletes specific geopoint'

      response '204', 'geopoint deleted' do
        run_test!
      end

      response '404', 'geopoint not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
