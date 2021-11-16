import request from 'supertest';

import app from '../app';

describe('GET /', () => {
  it('should response Hello World!', async () => {
    const response = await request(app).get('/');

    expect(response.text).toBe('Hello World!');
    expect(response.statusCode).toBe(200);
  })
});
