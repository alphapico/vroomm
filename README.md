# Vroom

## A minimalist two-wheel ride-hailiing services

<p style="text-align: center; padding-top:10px; padding-bottom:10px;"><img src="https://user-images.githubusercontent.com/65488712/211529704-26332d5f-5212-48fd-9350-fb1832497f29.png" width="500"></p>

Are you looking for a quick and convenient way to get around town on a two-wheeler? Look no further than our ride-hailing services!
Inspired by Gojek, our service makes it easy for passengers to request and receive rides, and for drivers to find and accept ride requests.

With our service, passengers can easily request rides and track the progress of their journey in real-time, while drivers can quickly find and accept ride requests. Our user-friendly mobile app, allow users to quickly request rides, track their driver's location, pay for their rides, and rate their driver.

## Built With

- [NestJS](https://nestjs.com/) - A progressive Node.js framework for building efficient, scalable, and enterprise-grade server-side applications.
- [Fastify](https://www.fastify.io/) - A web framework highly focused on providing the best developer experience with the least overhead and a powerful plugin architecture.
- [GraphQL](https://graphql.org/) - A query language for your API
- [MySQL](https://www.mysql.com/) - An open-source relational database management system
- [Redis](https://redis.io/) - An in-memory data structure store
- [Firebase](https://firebase.google.com/) - A platform for building mobile and web applications
- [Docker](https://www.docker.com/) - A platform for developing, shipping, and running applications in containers
- [NX](https://nx.dev/) - A set of extensible dev tools for monorepos
- [Flutter](https://flutter.dev/) - A mobile app SDK for building high-performance, high-fidelity apps for iOS and Android
- [OpenStreetMap](https://openstreetmap.org/) - An open-source map of the world

## Getting Started

### Installation

1. Installing the dependencies

```bash
# 1. Clone the repo
git clone https://github.com/alphapico/vroomm.git

# 2. Install dependencies
cd vroom
npm install

cd apps/driver-app
flutter pub get

cd apps/passenger-app
flutter pub get
```

2. Create a .env file in the root of the project and add the following variables:

```bash
MYSQL_HOST=
MYSQL_DB=
MYSQL_USER=
MYSQL_PASS=
MYSQL_PORT=
REDIS_HOST=
REDIS_PASS=
REDIS_PORT=
SHOW_DIRECTIONS=true
ADMIN_API_PORT=
DRIVER_API_PORT=
PASSENGER_API_PORT=
GATEWAY_API_PORT=

# DRIVER_SERVER_URL=http://x.x.x.x:<DRIVER_API_PORT>
DRIVER_SERVER_URL=
GATEWAY_SERVER_URL=
PASSENGER_SERVER_URL=
ADMIN_SERVER_URL=

JWT_SECRET=
ENCRYPTION_KEY=
JWT_PASSENGER_SECRET=
```

3. For Firebase Admin SDK, create Firebase project, click `Generate new Private Key` button to retrieve the private key (json file). Put this file inside `<root>/config` folder. Get Google Maps API key. Create file `config.development.json` with following contents and put under `<root>/config` folder

```bash
{
  "backendMapsAPIKey": "<Google-Map-Key>",
  "firebaseProjectPrivateKey": "<Firebase-admin-file>.json"
}
```

4. Boot up Docker

```bash
docker compose --env-file <your-env-file>.env up
```

5. Run migration files

```bash
nx run database:mig-run
```

6. Boot up microservices

```bash
nx serve admin-api
nx serve passenger-api
nx serve driver-api
nx serve payment-gateway
```

<br >

## Setting up data

Go to `<ADMIN_SERVER_URL>/graphql` or set and use GraphQL API in postman

```javascript
// userName = admin, password = admin
query login($userName: String!, $password: String!) {
  login(userName: $userName, password: $password) {
    token
  }
}

// input = { name:<Country Name>, currency:<ISO-4217 code>,
// enabled: true, location: [<Array of polygon {lat, lng}>]}
mutation CreateRegion($input: CreateRegion!) {
  createOneRegion(input: { region: $input }) {
    id
  }
}

// input = {"name":"<Any category name>"}}
mutation createOneServiceCategory($input: CreateOneServiceCategoryInput!) {
  createOneServiceCategory(input: $input) {
    id
    name
    services {
        id
        name
        description
    }
  }
}


// input = {"name": "<Any name>", "description": "<Any name>",
// "categoryId": <id from response createOneServiceCategory>, "baseFare": 3,
// "perHundredMeters": <calculated distance in hundred meters x perHundredMeters>,
// "perMinuteDrive": <calculated duration in minutes x perMinuteDrive>,
// "perMinuteWait": <if passenger ask to wait, what rate you should impose>,
// "prepayPercent": <Put this will force passenger to pay some percentage first before ride>,
// "minimumFee": <Provide at least minumum value Payment Gateway (Stripe) set>
// "roundingFactor": <write 0.05, will round to 5 cent>,
// "searchRadius": <in meter>, "twoWayAvailable": false,
// "maximumDestinationDistance": <Max distance you want to allow to ride within region>,
// "paymentMethod": "CashCredit",
// "cancellationTotalFee": <Fees deducted if passenger cancel when driver already accept>,
// "cancellationDriverShare": <Flat shares driver received when passenger cancel>,
// "providerSharePercent": <Percentage commision for provider>,
// "providerShareFlat": <Flat commision for provider >, "personCapacity": 1,}
mutation CreateService($input: CreateService!) {
  createOneService(input: { service: $input }) {
    id
  }
}

// "input" = { "id": <serviceId>, "relationIds": [<regionId>]}
mutation setRegionsOnService($input: SetRegionsOnServiceInput!) {
  setRegionsOnService(input: $input) {
    id
  }
}

// "input"  = "title": "Stripe",  "type": "Stripe", "enabled": true,
// "privateKey": "<Stripe private-key>",
// "publicKey": "<Stripe public-key>",
mutation createOnePaymentGateway($input: CreateOnePaymentGatewayInput!) {
  createOnePaymentGateway(input: $input) {
    __typename
    id
    enabled
    title
  }
}
```

<br />

## Running microservices inside Docker Container

If you intend to run and debug inside docker, you can set the multi-stage built inside `dockerfile`. This example shows how to set for admin-api, and can be replicated to other api

```dockerfile
FROM node:16.17.0-bullseye-slim as base

ARG CREATED_DATE=not-set
ARG SOURCE_COMMIT=not-set

LABEL org.opencontainers.image.authors=realtimestack@gmail.com
LABEL org.opencontainers.image.created=$CREATED_DATE
LABEL org.opencontainers.image.revision=$SOURCE_COMMIT
LABEL org.opencontainers.image.title="Vroom Admin Api"
LABEL org.opencontainers.image.licenses=MIT

ENV NODE_ENV=production
EXPOSE 3000
ENV PORT 3000

WORKDIR /workspace
COPY package*.json workspace.json nx.json tsconfig.base.json ./
RUN npm config list
RUN npm ci \
    && npm cache clean --force
ENV PATH /node/node_modules/.bin:$PATH

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

FROM base as dev
ENV NODE_ENV=development
RUN npm config list
RUN npm install --only=development \
    && npm cache clean --force
```

Add also to `docker-compose.yml` file this snippet

```yaml
services:
  admin-api:
    image: vroom-admin-api:dev
    platform: 'linux/amd64'
    build:
      context: .
      dockerfile: ./apps/admin-api/Dockerfile
      target: dev
    ports:
      - '4001:3000'
      - '9229:9229'
    volumes:
      - ./apps/admin-api:/workspace/apps/admin-api
    command: npx nx serve admin-api
```

## Monitor containers performances

There are a few options to monitor Docker container performance that are similar to `PM2`. One of the recommended one is `cAdvisor`, meanwhile the simplest one is `Portainer`. In the example below we show how to install `cAdvisor`. This exposes the `cAdvisor` web interface on port 8080 and mounts several host directories as volumes in the container

```yaml
services:
  cadvisor:
    image: google/cadvisor:latest
    ports:
      - '8080:8080'
    volumes:
      - '/:/rootfs:ro'
      - '/var/run:/var/run:rw'
      - '/sys:/sys:ro'
      - '/var/lib/docker/:/var/lib/docker:ro'
```

## Future planning

- VroomShop features
- VroomPacket features
- Orchestrated using K8s
- Decoupled pubsub features so it can be used with any message broker
- Automated end-to-end testing with Cucumber
