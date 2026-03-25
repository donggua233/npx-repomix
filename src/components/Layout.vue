<template>
  <div class="layout">
    <el-container>
      <el-header class="header">
        <div class="logo" @click="$router.push('/')">
          校园二手交易平台
        </div>
        <div class="search-bar">
          <el-input
            v-model="searchQuery"
            placeholder="搜索商品..."
            class="input-with-select"
          >
            <template #append>
              <el-button :icon="Search" />
            </template>
          </el-input>
        </div>
        <div class="actions">
          <el-button type="primary" @click="$router.push('/publish')">发布商品</el-button>
          <el-button @click="$router.push('/login')">登录/注册</el-button>
          <el-button circle :icon="User" @click="$router.push('/profile')" />
        </div>
      </el-header>
      <el-main class="main-content">
        <router-view />
      </el-main>
    </el-container>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { Search, User } from '@element-plus/icons-vue'

const searchQuery = ref('')
</script>

<style scoped>
.layout {
  min-height: 100vh;
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-bottom: 1px solid #eee;
  background-color: #fff;
  padding: 0 20px;
}

.logo {
  font-size: 20px;
  font-weight: bold;
  color: #409EFF;
  cursor: pointer;
}

.search-bar {
  flex: 1;
  max-width: 400px;
  margin: 0 40px;
}

.actions {
  display: flex;
  align-items: center;
  gap: 15px;
}

.main-content {
  padding: 20px;
  background-color: #f5f7fa;
  min-height: calc(100vh - 60px);
}
</style>
