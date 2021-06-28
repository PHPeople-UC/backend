require 'swagger_helper'

describe 'API V1 Property Services', swagger_doc: 'v1/swagger.json' do
  path '/property_services' do
    get 'Retrieves Property Services' do
      description 'Retrieves all the property_services'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:property_service, collection_count) }

      response '200', 'Property Services retrieved' do
        schema('$ref' => '#/definitions/property_services_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Property Service' do
      description 'Creates Property Service'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :property_service, in: :body)

      response '201', 'property_service created' do
        let(:property_service) do
          {
            name: 'Some name',
            description: 'Some description'
          }
        end

        run_test!
      end
    end
  end

  path '/property_services/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_property_service) { create(:property_service) }
    let(:id) { existent_property_service.id }

    get 'Retrieves Property Service' do
      produces 'application/json'

      response '200', 'property_service retrieved' do
        schema('$ref' => '#/definitions/property_service_resource')

        run_test!
      end

      response '404', 'invalid property_service id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Property Service' do
      description 'Updates Property Service'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :property_service, in: :body)

      response '200', 'property_service updated' do
        let(:property_service) do
          {
            name: 'Some name',
            description: 'Some description'
          }
        end

        run_test!
      end
    end

    delete 'Deletes Property Service' do
      produces 'application/json'
      description 'Deletes specific property_service'

      response '204', 'property_service deleted' do
        run_test!
      end

      response '404', 'property_service not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
