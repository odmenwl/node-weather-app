import { ICity } from '$core/intefaces';


export const cities: Partial<ICity>[] = [
  {
    name: 'Paris',
    longitude: 2.34864,
    latitude: 48.85339,
    country: {
      name: 'France',
      code: 'FR',
    },
  },
  {
    name: 'Berlin',
    longitude: 13.41053,
    latitude: 52.524368,
    country: {
      name: 'German',
      code: 'DE',
    }
  },
  {
    name: 'Madrid',
    longitude: -3.70256,
    latitude: 40.4165,
    country: {
      name: 'Espana',
      code: 'ES'
    }
  },
  {
    name: 'Rome',
    longitude: 12.4839,
    latitude: 41.894741,
    country: {
      name: 'Italia',
      code: 'IT'
    }
  },
  {
    name: 'Bern',
    longitude: 7.44744,
    latitude: 46.94809,
    country: {
      name: 'Switzerland',
      code: 'CH'
    }
  },
];
