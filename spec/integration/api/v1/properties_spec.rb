require 'swagger_helper'

describe 'API V1 Properties', swagger_doc: 'v1/swagger.json' do
  path '/properties' do
    get 'Retrieves Properties' do
      description 'Retrieves all the properties'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:property, collection_count) }

      response '200', 'Properties retrieved' do
        schema('$ref' => '#/definitions/properties_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Property' do
      description 'Creates Property'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :property, in: :body)

      response '201', 'property created' do
        let(:property) do
          {
            name: 'Some name',
            commune: 'Some commune',
            description: 'Some description'
          }
        end

        run_test!
      end
    end
  end

  path '/properties/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_property) { create(:property) }
    let(:id) { existent_property.id }

    get 'Retrieves Property' do
      produces 'application/json'

      response '200', 'property retrieved' do
        schema('$ref' => '#/definitions/property_resource')

        run_test!
      end

      response '404', 'invalid property id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Property' do
      description 'Updates Property'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :property, in: :body)

      response '200', 'property updated' do
        let(:property) do
          {
            name: 'Some name',
            commune: 'Some commune',
            description: 'Some description'
          }
        end

        run_test!
      end
    end

    delete 'Deletes Property' do
      produces 'application/json'
      description 'Deletes specific property'

      response '204', 'property deleted' do
        run_test!
      end

      response '404', 'property not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
