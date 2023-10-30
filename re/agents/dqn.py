import gymnasium as gym

import tensorflow as tf
from keras.models import Sequential
from keras.layers import Dense

import numpy as np
import random
from collections import deque

class DQNAgent():
    def __init__(self, env):
        self.env = env

        self.state_size = env.observation_space.shape[0]
        self.action_size = env.action_space.n

        self.discount_rate = 0.95
        self.learning_rate = 0.001

        self.epsilon = 1
        self.epsilon_decay = 0.995
        self.epsilon_min = 0.01

        self.replay_memory = deque(maxlen=1000)

        self.model = self.build_model()

    def build_model(self):
        model = Sequential()
        model.add(Dense(24, input_dim=self.state_size, activation="relu"))
        model.add(Dense(24, activation="relu"))
        model.add(Dense(self.action_size, activation="linear"))
        model.compile(loss="mse", optimizer=tf.keras.optimizers.legacy.Adam(learning_rate=self.learning_rate))
        return model
    
    def save(self, filepath):
        self.model.save(filepath)

    def action(self, state):
        if random.uniform(0,1) <= self.epsilon:
            return self.env.action_space.sample()
        else:
            action_values = self.model.predict(state, verbose=0)
            return np.argmax(action_values[0])

    def remember(self, state, action, reward, next_state, done):
        self.replay_memory.append((state, action, reward, next_state, done))

    def replay(self, batch_size):
        if len(self.replay_memory) < batch_size:
            return
        
        minibatch = random.sample(self.replay_memory, batch_size)
        for state, action, reward, next_state, done in minibatch:
            if done:
                target = reward
            else:
                target = reward + self.discount_rate * np.amax(self.model.predict(next_state, verbose=0))

            train_target = self.model.predict(state, verbose=0)
            train_target[0][action] = target
            self.model.fit(state, train_target, verbose=0)

    def greedy(self):
        if self.epsilon > self.epsilon_min:
            self.epsilon *= self.epsilon_decay

if __name__ == "__main__":
    env = gym.make('CartPole-v1')
    agent = DQNAgent(env)

    batch_size = 16
    episodes = 50
    for episode in range(episodes):
        state, _ = env.reset()
        state = np.reshape(state, [1,4])

        time = 0
        while True:
            action = agent.action(state)
            next_state, reward, done, _, _ = env.step(action)
            next_state = np.reshape(state, [1,4])

            agent.remember(state, action, reward, next_state, done)

            state = next_state

            agent.replay(batch_size)

            agent.greedy()

            time += 1

            if done:
                print('episode: {}, time: {}'.format(episode, time))
                break
    
    agent.save("dql_model")