
########################
# Distance computation #
########################

#' The Distance between each pair of points of the given dataset.
#' A function to compute distances (euclidean, manhattan or any d-distance) between the points within the given dataset.
#'
#' @param dataset Any given dataset, any (.txt, .csv,..ect.),
#' such that the separator between its columns and lines should be a blank space " ",
#' and the number of its observations (lines) and the number of its features should be
#' a moderate number (not too large), and the type of its elements (attributes) should
#' be of numerical type (continous or multivalued values) for calculating the distances.
#' and the observations with missing values should be removed from the dataset (and note
#' that you can use the Milligan Cooper method to standardize the dataset's values).
#'
#' @return The function returns the distance matrix of all the dataset, distances between each pair of nodes within this dataset.
#' distance.matrix(dataset)
#' @export

distance.matrix <- function(dataset){

  d <- as.integer(readline(" manhattan distance (1), Euclidean distance(2) or nTh distance(n) : "))

  # Variable assignment
  donnees <- dataset
  n_c <- ncol(donnees)
  n_l <- nrow(donnees)
  dim <- n_l

  # Distance matrix
  # Here we compute the euclidean distance, and the manhattan, and it also can be any other d-distance (Minkowski), (more general)

  m <- matrix(nrow=dim,ncol=dim)

  for (i in 1:dim)
  {
    for (j in 1:dim)
    {
      distance <- 0

      for (k in 1:n_c)
      {
        distance <- distance + abs((donnees[i,k] - donnees[j,k])^d)
      }
      m[i,j] <- distance^(1/d)

    }
  }
  return(m)
}

###################################
# RNG graph construction function #
###################################


#' Draw the Neighborhood Graph-NG of the dataset
#'
#' Rng a function to construct the NG graph (Neighborhood Graph) using
#' the relative neighborhood graph structure, in our case(RNG).
#'
#' @param dataset Any given dataset, any (.txt, .csv,..ect.),
#' such that the separator between its columns and lines should be a blank space " ",
#' and the number of its observations (lines) and the number of its features should be
#' a moderate number (not too large), and the type of its elements (attributes) should
#' be of numerical type (continous or multivalued values) for calculating the distances.
#' and the observations with missing values should be removed from the dataset (and note
#' that you can use the Milligan Cooper method to standardize the dataset's values).
#'
#' @importFrom graphics segments
#' @return The function plots the NG graph (RNG) and returns the sorted list by size(taille/poids) in decreasing order of the created edges of the RNG graph.
#' rng(dataset)
#' @export
rng<-function(dataset){

  #### connect nodes ####
  m <- distance.matrix(dataset)
  dim <- nrow(m)

  connexion <<- matrix(nrow=dim,ncol=dim, FALSE)

  nb_edges <- 0

  for (i in 1:dim)
  {
    for (j in 1:dim)
    {
      cx <- FALSE
      if (i != j)
      {
        cx <- TRUE

        for (k in 1:dim)
        {
          cx <- cx && !((m[i,k] < m[i,j]) &&  (m[j,k] < m[i,j]))
        }
        connexion[i,j] <<- cx
      }
      if (connexion[i,j])
      {nb_edges <- nb_edges + 1
      }
    }
  }
  edges <- nb_edges / 2

  ### Plot RNG graph according to the connected nodes ###
  for (i in 1:(dim-1))
  {
    for (j in i:dim)
    {
      if (connexion[i,j])
      {
        segments(dataset[i,1], dataset[i,2], dataset[j,1], dataset[j,2], col= 'red')
      }
    }
  }
  Sys.sleep(2)

  #### Descent sorting (by size) of the edges step2 of GBC algorithm ####
  edges_mat <- matrix(nrow = edges, ncol = 3,0) #matrix containing all the edges , with no duplicate ones (nrows=edges)
  colnames(edges_mat)<- c("poids", "n1", "n2")  #poids= weight of an edge, n1=first node, n2=second node, (n1,n2) the edge
  q <- 1

  for(i in 1:dim)
  {
    for(j in i:dim)
    {
      if (connexion[i,j])
      {
        edges_mat[q,"poids"] <- m[i,j]
        edges_mat[q,"n1"] <- i
        edges_mat[q,"n2"] <- j
        q <- q + 1
      }
    }
  }
  ord_edges <- edges_mat[order(edges_mat[,"poids"], decreasing = TRUE),]#sorting in decreasing order by size of the edges, ord_edges the ordered edges matrix
  return(ord_edges)
}

#########################
##### GBC Algorithm #####
#########################

temp_conn <<- matrix(nrow = 1,ncol = 1,FALSE) #to copy the connexion matrix
current_cluster <<- 1 #initialisation ,from cluster 1
cluster_number <<- matrix(nrow = 1,ncol = 1, -1) #matrix containing the nodes and their respective cluster to which they belong

#' Gbc function is a graph based clustering method.
#' A function to detect the appropriate number of clusters , and returns the appropriate clustering.
#'
#' @param x Any given dataset, any (.txt, .csv,..ect.),
#' such that the separator between its columns and lines should be a blank space " ",
#' and the number of its observations (lines) and the number of its features should be
#' a moderate number (not too large), and the type of its elements (attributes) should
#' be of numerical type (continous or multivalued values) for calculating the distances.
#' and the observations with missing values should be removed from the dataset (and note
#' that you can use the Milligan Cooper method to standardize the dataset's values).
#'
#' @return This algorithm detects the appropriate number of clusters k, so the appropriate clustering.
#'
#' @importFrom graphics plot
#' @importFrom graphics segments
#' @importFrom stats calinhara
#' @export

gbc <- function(x){

  dataset <- read.table(x , quote="\"")

  #dataset <- read.table(x ,sep = "," ,quote="\"")
  #dataset[5] <- NULL

  n <<- dim(dataset)[1]

  print("The dimension of the dataset : ")
  print(n)

  ### Plot of dataset before Rng construction ###
  plot(dataset, asp=1)
  Sys.sleep(2)

  #######                      Phase 1                      #######

  u_k <- matrix(nrow = 1,ncol = n,0)
  delta_k <- matrix(nrow = 1,ncol = n,0)

  ### calls rng construction of the graph step1 and step2 descent sorting  ###
  ord_edges <- rng(dataset)

  ##initialisation step3##
  k <- 2
  sum_k <- 0
  n_e <- 1
  max_k = 0

  ##creating sub-graphs##

  temp_conn <<- connexion #copy of connexion matrix
  for(edge in 1:dim(ord_edges)[1])
  {
    if(k >= n)
      break

    u = ord_edges[edge,2]
    v = ord_edges[edge,3]

    sub_graph <<- matrix(nrow = 1,ncol = n,FALSE)
    vis <<- matrix(nrow = 1,ncol = n,FALSE)

    calc_sub_graph(u)
    temp_conn[u,v] <<- FALSE#delete max edge, (u,v) or (v,u) same, it's non oriented graph
    temp_conn[v,u] <<- FALSE
    sum_k <- sum_k + ord_edges[edge,1]#add size of max edge to sum_k
    dfs(u)

    ##check the connectivity of the subgraph after the cutted max_edge##
    is_connected = TRUE
    for(i in 1:n)
      if(sub_graph[i] && !vis[i])
        is_connected = FALSE

    if(is_connected)
    {
      n_e <- n_e +1
    }
    else
    {
      u_k[k] <- sum_k/n_e
      if(u_k[k] > 0)
        max_k = k
      k <- k + 1
      n_e <- 1
      sum_k <- 0
    }
  }

  for(i in 2:max_k-1)
  {
    delta_k[i] = (u_k[i]-u_k[i+1])/(u_k[i]+u_k[i+1])
  }
  print("The delta values :")
  print(delta_k)


  ##Return Optimal k associated to the max of deta_k##
  print("dela_max:")
  print(max(delta_k))

  optimal_k = which(delta_k == max(delta_k))
  print("The appropriate number of clusters k :")
  print(optimal_k)

  #######                      Phase 2                      #######
  k <- 2
  sum_k <- 0
  n_e <- 1
  max_k = 0

  a_sp<-c(0)#vector to display the number of the cutted edges at each level k
  som_k<-c(0)#vector to display the number of the sum of the weights of cutted edges at each level k

  temp_conn <<- connexion
  for(edge in 1:dim(ord_edges)[1])
  {

    if(k > optimal_k)
      break

    u = ord_edges[edge,2]
    v = ord_edges[edge,3]

    sub_graph <<- matrix(nrow = 1,ncol = n,FALSE)
    vis <<- matrix(nrow = 1,ncol = n,FALSE)

    calc_sub_graph(u)
    temp_conn[u,v] <<- FALSE
    temp_conn[v,u] <<- FALSE
    sum_k <- sum_k + ord_edges[edge,1]
    dfs(u)

    is_connected <-TRUE
    for(i in 1:n)
      if(sub_graph[i] && !vis[i])
        is_connected <- FALSE

    if(is_connected)
    {
      n_e <- n_e + 1

    }
    else
    {
      u_k[k] <- sum_k/n_e
      print("The average of the size of the cutted edges:")
      print(u_k[k])

      current_cluster <<- 1
      cluster_number <<- matrix(nrow = 1,ncol = n, -1)
      for(i in 1:n)
        if(cluster_number[i] == -1)
        {
          set_cluster_number(i)
          current_cluster <<- current_cluster + 1
        }

      cluster_fequency <<- matrix(nrow = 1,ncol = current_cluster-1, 0)#displays the number of points of each k level

      for(i in 1:n)
        cluster_fequency[cluster_number[i]] <<- cluster_fequency[cluster_number[i]] + 1

      print("frequency array:")
      print(cluster_fequency)

      a_sp<-append(a_sp,n_e)
      som_k<-append(som_k,sum_k)

      max_k = k
      k <- k + 1
      n_e <- 1
      sum_k <- 0
    }
  }

  print("The number of the cutted edges at each K level:")
  print(a_sp)
  print("The sum of legnth of the cutted edges at each K level:")
  print(som_k)

#######                      End phase 2                      #######


  #print("The associated cluster to each node in the dataset:")
  #print(cluster_number)

  ## Plot The result (final clustering) ##

  plot(dataset, col=cluster_number , pch=20)

  print(" The appropriate number of clusters is :")
  return(optimal_k)
}

##################                        End GBC                      ##################

## GBC's auxiliary functions

## Visit and mark nodes of the graph (or the Sub graph) before cutting ##
#' The nodes within the graph (or the subgraph) before cutting the max_edge. This function
#' aims to mark all the graph nodes before cutting the max_edge.
#'
#' @param cur The current node
#'
#' @return The function returns the nodes contained within the graph (subgraph) before cutting the max_edge.
#'calc_subgraph(cur)
#' @export
calc_sub_graph <- function(cur){
  if(sub_graph[cur])
    return()
  sub_graph[cur] <<- TRUE
  for(i in 1:n)
    if(temp_conn[cur,i])
      calc_sub_graph(i)
}

## Visit and mark the nodes of the graph after cutting ##
#' The contained nodes in the sugraph after cutting the max_edge.
#' This function visits and mark the nodes of the subgraph after cutting the max_edge.
#'
#' @param cur The current node
#'
#' @return It uses the Depth First Search algorithm to return the visited  nodes after cutting the max_edge in order to check whether the subgraph remains connected after the cut or not.
#' dfs(currentnode)
#' @export
dfs <- function(cur){
  if(vis[cur])
    return()
  vis[cur] <<- TRUE
  for(i in 1:n)
    if(temp_conn[cur,i])
      dfs(i)
}

## Associate each node to its cluster ##
#' The number of the cluster for each node.
#' This function associates each node to its cluster (where it belongs).
#'
#' @param cur The current node
#'
#' @return It returns the number of the cluster of each node in the dataset.
#' @importFrom utils read.table
#' @importFrom graphics plot
#' @export
set_cluster_number <- function(cur){
  if(cluster_number[cur] != -1)
    return()
  cluster_number[cur] <<- current_cluster
  for(i in 1:n)
    if(temp_conn[cur,i])
      set_cluster_number(i)
}

###################################
#####   End GBC Algorithm    ######
###################################
