import axios from 'axios'
import { ElMessage } from 'element-plus'

const request = axios.create({
  baseURL: import.meta.env.VITE_API_URL || '/api',
  timeout: 5000
})

// Request interceptor
request.interceptors.request.use(
  config => {
    // You can get token from pinia store or localStorage here
    const token = localStorage.getItem('token')
    if (token) {
      config.headers['Authorization'] = `Bearer ${token}`
    }
    return config
  },
  error => {
    console.error('Request Error:', error)
    return Promise.reject(error)
  }
)

// Response interceptor
request.interceptors.response.use(
  response => {
    const res = response.data
    // Custom response status handling
    // If you use standard HTTP status codes, you can adjust this logic
    if (res.code && res.code !== 200 && res.code !== 0) {
      ElMessage.error(res.message || 'Error')

      // Handle token expiration
      if (res.code === 401 || res.code === 403) {
        // e.g., redirect to login
        localStorage.removeItem('token')
        // router.push('/login')
      }
      return Promise.reject(new Error(res.message || 'Error'))
    }
    return res
  },
  error => {
    console.error('Response Error:', error)
    ElMessage.error(error.message || 'Server Error')
    return Promise.reject(error)
  }
)

export default request
