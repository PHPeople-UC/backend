require 'swagger_helper'

describe 'API V1 Calendar Schedules', swagger_doc: 'v1/swagger.json' do
  path '/users/:id/calendar_schedules' do
    get 'Retrieves Properties' do
      description "Retrieves all the schedules of the user."
      produces 'application/json'

      parameter(
        name: :property_id,
        in: :query,
        example: 1,
        description: 'Used to filter by property'
      )

      parameter(
        name: :start_date,
        in: :query,
        example: '2019-08-20 22:05:59',
        description: 'Used to filter by start date'
      )

      parameter(
        name: :end_date,
        in: :query,
        example: '2020-08-20 22:05:59',
        description: 'Used to filter by end date'
      )

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:calendar_schedule, collection_count) }

      response '200', 'Calendar schedules retrieved' do
        schema('$ref' => '#/definitions/calendar_schedules_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Property' do
      description 'Creates Property. This call need a Bearer Authentication with a user session JWT'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :property_params, in: :body, schema: {
        type: :object,
        properties: {
          property: {
            type: :object,
            properties: {
              name: { type: :string, example: "Example Property" },
              commune: { type: :string, example: "Santiago" },
              description: { type: :string, example: "A very nice place" },
              active: { type: :boolean, example: true },
              price: { type: :float, example: 1000 },
              price_unit: { type: :string, example: "UF" },
              size: { type: :float, example: 1000 },
              size_unit: { type: :string, example: "hectare" },
              address: { type: :string, example: "100 example st" }
            }
          }
        },
        required: ['name', 'commune', 'description', 'price', 'price_unit', 'size', 'size_unit',
                   'address']
      }

      response '201', 'property created' do
        run_test!
      end
    end
  end

  path '/properties/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_property) { create(:property) }
    let(:id) { existent_property.id }

    get 'Retrieves Property' do
      description 'You can pass the URL param \'deep\' set to true to receive a '\
      'nested response with each propertie\'s geopoints and services.'
      produces 'application/json'

      parameter(
        name: :deep,
        in: :query,
        example: 'true',
        description: 'If this params is present, you receiver geopoints & services in the answer'
      )

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
      description 'Updates Property. This call need a Bearer Authentication with a user session JWT'
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
      description 'Deletes specific property. This call need a Bearer Authentication with a user session JWT'

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
