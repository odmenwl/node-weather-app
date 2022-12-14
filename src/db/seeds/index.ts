import dataSource from '../data-source';

import { cities } from './data';

import { CityEntity, CityStatEntity, CountryEntity } from '$core/entites';



const seedCities = async () => {
  const cityRepository = await dataSource.getRepository(CityEntity);
  const countryEntity = await dataSource.getRepository(CountryEntity);
  const cityStatEntity = await dataSource.getRepository(CityStatEntity);

  await Promise.all(
    cities.map(async (city) => {
      const country = await countryEntity.save({
        name: city.country?.name,
        code: city.country?.code
      });

      const cityStat = await cityStatEntity.save({
        numberOfView: 0,
      });

      await cityRepository.save({
        name: city.name,
        longitude: city.longitude,
        latitude: city.latitude,
        countryId: country.id,
        cityStatId: cityStat.id,
      });
    })
  );
};

const start = async () => {
  await dataSource.initialize();
  await seedCities();
};

start();
